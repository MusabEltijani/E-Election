import 'package:e_election/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Global app theme manager
ThemeData myTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.black),
      color: Colors.white,
      elevation: 1,
      shape: ShapeBorder.lerp(
          null,
          Border(
              bottom:
                  BorderSide(color: Colors.black.withOpacity(0.3), width: 0.5)),
          1),
      centerTitle: true,
      titleSpacing: 20,
      titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'NotoSansArabic'),
    ),
    scaffoldBackgroundColor: ColorsWorker().getScaffoldColor(),
    fontFamily: 'NotoSansArabic');
