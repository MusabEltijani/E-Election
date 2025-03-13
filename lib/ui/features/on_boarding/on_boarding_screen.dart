// import 'package:e_election/app/theme/app_colors.dart';
// import 'package:e_election/app/theme/ui_helpers.dart';
import 'dart:math';

import 'package:e_election/generated/locale_keys.g.dart';
import 'package:e_election/ui/features/candidate/candidate_screen.dart';
import 'package:e_election/ui/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:e_election/ui/features/on_boarding/widgets/on_boarding_item.dart';
import 'package:e_election/ui/features/scan_passport/scan_passport_screen.dart';
// import 'package:e_election/ui/widgets/button_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/onBoardingScreen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;

  @override
  void initState() {
    super.initState();
  }

  void _onNavigate(BuildContext context, String route) {
    context.pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = context.locale.languageCode == 'ar';
    // Add screen size helpers
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => OnBoardingCubit()..getOnBoardingData(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFEEF4FF), // Light blue background
            body: Stack(
              children: [
                // Curved background
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    painter: CurvedBackgroundPainter(),
                    child: const SizedBox(height: 200),
                  ),
                ),

                // Main content
                SafeArea(
                  child: state is OnBoardingLoading
                      ? Padding(
                          padding: EdgeInsets.all(24.w),
                          child: Column(
                            children: [
                              SizedBox(height: 80.h),
                              Container(
                                height: 200.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              Container(
                                height: 32.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Skeleton for description
                              Column(
                                children: List.generate(
                                  3,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      height: 16,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // Skeleton for page indicators
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              // Skeleton for button
                              Container(
                                height: 56,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        )
                      : state is OnBoardingLoaded
                          ? Column(
                              children: [
                                // Skip button
                                Align(
                                  alignment: isRTL
                                      ? Alignment.topLeft
                                      : Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0.w),
                                    child: TextButton(
                                      onPressed: () {
                                        _onNavigate(context,
                                            ScanPassportScreen.routeName);
                                      },
                                      child: Text(
                                        LocaleKeys.skip.tr(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // PageView with responsive height
                                Expanded(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: min(screenWidth * 0.9, 600.w),
                                    ),
                                    child: PageView.builder(
                                      controller: boardingController,
                                      reverse: isRTL,
                                      onPageChanged: (int page) {
                                        setState(() {
                                          isLast = page ==
                                              state.data.data.length - 1;
                                        });
                                      },
                                      itemBuilder: (context, index) =>
                                          OnBoradingItemWidget(
                                        imageLink:
                                            state.data.data[index].avatar,
                                        title: state.data.data[index].title,
                                        content:
                                            state.data.data[index].description,
                                      ),
                                      itemCount: state.data.data.length,
                                    ),
                                  ),
                                ),

                                // Page indicators with responsive spacing
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    state.data.data.length,
                                    (index) => Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      width: 8.w,
                                      height: 8.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: boardingController.hasClients &&
                                                boardingController.page
                                                        ?.round() ==
                                                    index
                                            ? const Color(0xFF6C63FF)
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),

                                // Follow-up button with responsive sizing
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 16.h,
                                  ),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: min(screenWidth * 0.9, 400.w),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (isLast) {
                                          _onNavigate(context,
                                              ScanPassportScreen.routeName);
                                        } else {
                                          boardingController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF6C63FF),
                                        minimumSize:
                                            Size(double.infinity, 56.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28.r),
                                        ),
                                      ),
                                      child: Text(
                                        isLast
                                            ? LocaleKeys.get_started.tr()
                                            : LocaleKeys.follow_up.tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                              ],
                            )
                          : Center(
                              child: Text(LocaleKeys.error_title.tr()),
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.5,
        0,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
