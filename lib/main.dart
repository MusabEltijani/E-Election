import 'dart:io';

import 'package:e_election/app/common_blocs/common_bloc.dart';
import 'package:e_election/app/constants.dart';
import 'package:e_election/app/di/injector.dart';
import 'package:e_election/app/http_orverride.dart';
import 'package:e_election/app/language/language_manager.dart';
import 'package:e_election/app_error.dart';
import 'package:e_election/app_view.dart';
import 'package:e_election/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = DevHttpOverrides();

  await initializeDependencies();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ErrorWidget.builder = (_) => const AppError();
  if (kReleaseMode) ErrorWidget.builder = (_) => const AppError();

  try {
    runApp(EasyLocalization(
        supportedLocales: LanguageManager.instance!.supportedLocales,
        path: LANGUAGE_ASSETS_PATH,
        assetLoader: const CodegenLoader(),
        fallbackLocale: LanguageManager.instance!.arLocale,
        child: const AppRoot()));
  } catch (e) {
    Logger().e(e.toString());
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    //inti Local
    LanguageManager.defaultLanguage = context.locale;

    return MultiBlocProvider(
      providers: CommonBloc.blocProviders,
      child: const ScreenUtilInit(
          designSize: Size(375, 812), // Your design size
          minTextAdapt: true,
          splitScreenMode: true,
          child: AppView()),
    );
  }
}
