import 'package:e_election/app/common_blocs/authentication/authentication_bloc.dart';
import 'package:e_election/app/common_blocs/common_bloc.dart';
import 'package:e_election/app/routes/routes.dart';
import 'package:e_election/app/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    CommonBloc.authenticationBloc.add(AuthenticationStarted());
  }

  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routerConfig: AppRouter.routerConfig(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
