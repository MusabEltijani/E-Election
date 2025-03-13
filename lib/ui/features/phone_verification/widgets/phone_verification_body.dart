import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/ui/features/candidate/candidate_screen.dart';
import 'package:e_election/ui/features/scan_passport/cubit/scan_passport_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/phone_verification_cubit.dart';
import 'package:flutter/gestures.dart';

class PhoneVerificationBody extends StatefulWidget {
  final String passportNumber;

  const PhoneVerificationBody({
    super.key,
    required this.passportNumber,
  });

  @override
  State<PhoneVerificationBody> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<PhoneVerificationBody> {
  String code = '';

  bool _isValidCode() {
    return code.length == 4;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isRTL = Localizations.localeOf(context).languageCode == 'ar';

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhoneVerificationCubit(
            passportNumber: widget.passportNumber,
          ),
        ),
        BlocProvider(
          create: (context) => ScanPassportCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PhoneVerificationCubit, PhoneVerificationState>(
            listener: (context, state) {
              if (state is PhoneVerificationSuccess &&
                  state.passPortVerificationModel.message == 'authenticated') {
                context.pushReplacementNamed(CandidateScreen.routeName);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification code sent successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              if (state is PhoneVerificationFailure) {
                // this is for the case when the user is not registered

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          BlocListener<ScanPassportCubit, ScanPassportState>(
            listener: (context, state) {
              if (state is ScanPassportSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Verification code sent successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
              if (state is ScanPassportError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: BlocBuilder<PhoneVerificationCubit, PhoneVerificationState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.width * 0.06),
                    child: Column(
                      children: [
                        Align(
                          alignment:
                              isRTL ? Alignment.topRight : Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              isRTL ? Icons.arrow_forward : Icons.arrow_back,
                              size: screenSize.width * 0.07,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Text(
                          LocaleKeys.verification_code_title.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenSize.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Text(
                          LocaleKeys.verification_code_subtitle.tr(),
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          widget.passportNumber,
                          style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Code display
                        Text(
                          code.padRight(4, '-').split('').join('  '),
                          style: const TextStyle(
                            fontSize: 32,
                            letterSpacing: 8,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Continue button
                        ElevatedButton(
                          onPressed: state is PhoneVerificationLoading ||
                                  !_isValidCode()
                              ? null
                              : () {
                                  context
                                      .read<PhoneVerificationCubit>()
                                      .verifyCode(code, widget.passportNumber);
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C63FF),
                            minimumSize:
                                Size(double.infinity, screenSize.height * 0.07),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: state is PhoneVerificationLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : Text(
                                  LocaleKeys.verification_code_button.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenSize.width * 0.045,
                                  ),
                                ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),

                        RichText(
                          text: TextSpan(
                            text: LocaleKeys
                                .verification_code_didnt_receive_code
                                .tr(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'NotoSansArabic',
                            ),
                            children: [
                              TextSpan(
                                text: LocaleKeys.verification_code_send_again
                                    .tr(),
                                style: TextStyle(
                                  color: Colors.red.shade400,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'NotoSansArabic',
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context
                                        .read<ScanPassportCubit>()
                                        .validatePassportNumber(
                                            widget.passportNumber);
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // const Spacer(),
                        // Number pad
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: [
                              ...List.generate(
                                  9,
                                  (index) =>
                                      _buildNumberButton('${index + 1}')),
                              const SizedBox(),
                              _buildNumberButton('0'),
                              _buildBackspaceButton(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return InkWell(
      onTap: () {
        if (code.length < 4) {
          setState(() {
            code += number;
          });
        }
      },
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return InkWell(
      onTap: () {
        if (code.isNotEmpty) {
          setState(() {
            code = code.substring(0, code.length - 1);
          });
        }
      },
      child: const Center(
        child: Icon(Icons.backspace_outlined),
      ),
    );
  }
}
