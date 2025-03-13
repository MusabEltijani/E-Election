import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppColor {
  //MaterialColor
  static const MaterialColor primaryMaterialColor =
      MaterialColor(_primarycolorPrimaryValue, <int, Color>{
    50: Color(0xFFE3F3E9),
    100: Color(0xFFB8E2C7),
    200: Color(0xFF89CFA2),
    300: Color(0xFF59BC7D),
    400: Color(0xFF36AD61),
    500: Color(_primarycolorPrimaryValue),
    600: Color(0xFF10973E),
    700: Color(0xFF0D8D36),
    800: Color(0xFF0A832E),
    900: Color(0xFF05721F),
  });
  static const int _primarycolorPrimaryValue = 0xFF129F45;

  static const MaterialColor primarycolorAccent =
      MaterialColor(_primarycolorAccentValue, <int, Color>{
    100: Color(0xFFA2FFB2),
    200: Color(_primarycolorAccentValue),
    400: Color(0xFF3CFF5D),
    700: Color(0xFF22FF48),
  });
  static const int _primarycolorAccentValue = 0xFF6FFF87;

  static const Color primaryColor = Color(0xff0081b8);
  static const Color inputColor = Color(0xffd3d1d1);
  static const Color textColorGrey = Color(0xff0081b8);
  static const Color buttonDesibleColor = Color(0xff0081b8);
  static const Color primaryColorTransparent = Color.fromARGB(255, 7, 136, 187);
  static const Color lightColorTransparent = Color(0x78ffffff);
  static const Color secondaryColor = Color(0xff040707);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color mediumGreyColor = Color(0xff868686);
  static const Color lightButtonColor = Color(0xffE4E6EB);
  static const Color lightGreyColor = Color(0xffe5e5e5);
  static const Color lightGrey2Color = Color(0xffEBEBEB);
  static const Color veryLightGreyColor = Color(0xfff2f2f2);
  static const Color scaffoldColor = Color(0xffeeeeee);
  static const Color scaffoldColorTow = Color(0xfffcfbfd);
  static const Color textColorLight = Color(0xff5D686B);
  static const Color colorLight = Color(0xffc0c0c0);
  static const Color BackGroundC = Color(0xffF6F6F6);
  static const Color iconColor = Color(0xff282727);
  static const Color iconColorLight = Color(0xff626262);
  static const iconColorGery = Color(0xFF797979);
  static const Color lineColor = Color(0xffc6c5c5);
  static const cardShadowColor = Color(0xFFd3d1d1);
  static const BackgroundLightCard = Color(0xFFFAFAFA);
  static const BackgroundLightColor = Color(0xFFF4F5FA);
  static const BackgroundLightColorTow = Color(0xFFF7F7F7);
  static const stepperColor = Color(0xFF08072C);
  static const BackgroundActiviationColor = Color(0xFFF7F8FA);
  static const TimeBackgroundColor = Color(0xFFEBF2FF);
  static const LocationBackgroundColor = Color(0xFFE9F1FF);

  static const textDarkColor = Color(0xFF212121);
  static const disableColor = Color(0x7F13567B);
  static const Color outgoingMessageBubbleColor = Color(0xff129F45);
  static const Color incomingMessageBubbleColor = Color(0xffEBEBEB);

  static Color Black = const Color(0xFF000000);
  static Color White = const Color(0xFFFFFFFF);
  static Color Transparent = const Color(0x00000000);
  static Color Blue = const Color(0xFF252941);

  static Color BlueDark = const Color(0xFF05060B);
  static Color Red = const Color(0xFFD13438);
  static Color RedDark = const Color(0xFF982626);

  static Color colorSuspend = const Color(0xFFEC7202);
  static Color colorActive = const Color(0xFF228B51);

  static Color successColor = const Color(0xFF62A465);
  static Color errorColor = const Color(0xFFD92727);
  static Color infoColor = const Color(0xFF5060BA);

  static Color CardDark = const Color(0xFF3B3E43);
  static Color CardLight = White;

  static Color BackgroundLight = const Color(0xFFF5F2F5);
  static Color BackgroundDark = const Color(0xFF24292E);

  static Color DividerLight = const Color(0xFFE0E0E0);
  static Color DividerDark = const Color(0xFF6E6E6E);

  static Color GrayCircle = const Color(0xFF919191);
  static Color RedCircle = const Color(0xFFD50000);
  static Color GreenCircle = const Color(0xFF00C853);
  static Color BorderLine = const Color(0xFFE5E5EA);

  static Color Red700 = const Color(0xFFD32F2F);
  static Color GrayBackground = const Color(0x0ff2f5f8);

  static Color Gray25 = const Color(0xFFF8F8F8);
  static Color Gray50 = const Color(0xFFF1F1F1);
  static Color Gray75 = const Color(0xFFECECEC);
  static Color Gray100 = const Color(0xFFE1E1E1);
  static Color Gray200 = const Color(0xFFEEEEEE);
  static Color Gray300 = const Color(0xFFACACAC);
  static Color Gray400 = const Color(0xFF919191);
  static Color Gray500 = const Color(0xFF6E6E6E);
  static Color Gray600 = const Color(0xFF535353);
  static Color Gray700 = const Color(0xFF616161);
  static Color Gray800 = const Color(0xFF292929);
  static Color Gray900 = const Color(0xFF212121);
  static Color Gray950 = const Color(0xFF141414);
  static Color BlackTransparent = const Color(0xBD000000);

  static Color selectedBottomItemColor = Red;
  static Color unselectedBottomItemColor = Gray500;

  static Color navigationBackIconDark = White;
  static Color navigationBackIconLight = Black;
}

class ColorsWorker {
  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  //#black color #090806
  Color getPrimerColor() {
    return hexToColor("#0eb1a4"); //next op (#0eb1a4) next op(#0d9e92);
  } //db0706

  Color getSecondaryColor() {
    return hexToColor("#ffffff");
  }

  Color getScaffoldColor() {
    return hexToColor("#eeeeee");
  }

  static Color getTextColor() {
    try {
      if (Platform.isAndroid) {
        return Colors.white;
      }
    } catch (e) {
      if (kIsWeb) {}
    }
    return Colors.black;
  }

  static Color getPrimaryColorByOS() {
    try {
      if (Platform.isAndroid) {
        return AppColor.primaryColor;
      }
    } catch (e) {
      if (kIsWeb) {}
    }
    return Colors.white;
  }

  static Color getIndicatorColor() {
    try {
      if (Platform.isAndroid) {
        return Colors.white;
      }
    } catch (e) {
      if (kIsWeb) {}
    }
    return AppColor.primaryColor;
  }
}
