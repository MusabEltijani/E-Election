import 'package:e_election/app/common_blocs/authentication/authentication_bloc.dart';
import 'package:e_election/app/common_blocs/common_bloc.dart';
import 'package:e_election/app/theme/app_assets.dart';
import 'package:e_election/app/theme/app_colors.dart';
import 'package:e_election/app/theme/ui_helpers.dart';
import 'package:e_election/ui/features/home/home_sccreen.dart';
import 'package:e_election/ui/features/on_boarding/on_boarding_screen.dart';
import 'package:e_election/ui/features/splash/bloc/splash_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:e_election/generated/locale_keys.g.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/SplashScreen';
  const SplashScreen({super.key});

  void _onNavigate(BuildContext context, String route) {
    context.pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashSetup()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, splashState) {
          if (splashState is SplashCompleted) {
            AuthenticationState authenticationState =
                CommonBloc.authenticationBloc.state;
            if (authenticationState is Authenticated) {
              _onNavigate(context, HomeScreen.routeName);
            } else {
              _onNavigate(context, OnBoardingScreen.routeName);
            }
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(AppAssets.logoPreview,
                            height: 150, width: 150),
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              LocaleKeys.version.tr(),
                              style: TextStyle(fontSize: 12.0),
                            ),
                            verticalSpaceSmall,
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              child: const SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: SpinKitSpinningLines(
                                    color: AppColor.primaryColor,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
