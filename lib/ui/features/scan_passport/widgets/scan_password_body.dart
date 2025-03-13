import 'package:e_election/app/theme/app_assets.dart';
import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/ui/features/phone_verification/phone_verification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_election/ui/features/scan_passport/cubit/scan_passport_cubit.dart';

class ScanPasswordBody extends StatefulWidget {
  const ScanPasswordBody({super.key});

  @override
  State<ScanPasswordBody> createState() => _ScanPasswordBodyState();
}

class _ScanPasswordBodyState extends State<ScanPasswordBody> {
  final TextEditingController _passportController = TextEditingController();

  @override
  void dispose() {
    _passportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = context.locale.languageCode == 'ar';

    return BlocProvider(
      create: (context) => ScanPassportCubit(),
      child: BlocConsumer<ScanPassportCubit, ScanPassportState>(
        listener: (context, state) {
          if (state is ScanPassportError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ScanPassportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Passport validated successfully'),
                backgroundColor: Colors.green,
              ),
            );

            context.pushReplacementNamed(
              PhoneVerificationScreen.routeName,
              extra: _passportController.text,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        LocaleKeys.scan_passport_title.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'NFC',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color(0xFF6C63FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        LocaleKeys.scan_passport_description.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      TextField(
                        controller: _passportController,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.enter_national_id.tr(),
                          errorText:
                              state is ScanPassportError ? state.message : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<ScanPassportCubit>()
                                .validatePassportNumber(
                                    _passportController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C63FF),
                            minimumSize: Size(double.infinity, 56.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                          ),
                          child: state is ScanPassportLoading
                              ? SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: const CircularProgressIndicator(
                                      color: Colors.white),
                                )
                              : Text(
                                  LocaleKeys.scan_passport_button.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SvgPicture.asset(
                        AppAssets.nfc,
                        height: 120.h,
                        width: 120.w,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        LocaleKeys.scan_passport_description.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      Text(
                        LocaleKeys.scan_passport_title.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF6C63FF),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 200.w,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<ScanPassportCubit>()
                                .validatePassportNFC();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C63FF),
                            minimumSize: Size(200.w, 56.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                          ),
                          child: Text(
                            LocaleKeys.use_nfc_button.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
            resizeToAvoidBottomInset: true,
          );
        },
      ),
    );
  }
}
