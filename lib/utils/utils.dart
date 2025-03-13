// import 'package:encrypt/encrypt.dart';

import 'package:e_election/app/language/language_manager.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

class Util {
  static String isoToDate(int date) {
    var datetime = DateTime.fromMillisecondsSinceEpoch(date, isUtc: true);

    return datetime.year.toString() +
        "-".toString() +
        datetime.month.toString() +
        "-".toString() +
        datetime.day.toString();
  }

  static String isoToDateWithoutDay(int date) {
    var datetime = DateTime.fromMillisecondsSinceEpoch(date, isUtc: true);

    return datetime.year.toString() +
        "-".toString() +
        datetime.month.toString();
  }

  static String formattedDate(String date) {
    var formattedDate =
        DateFormat('MMM d, yyyy', LanguageManager.defaultLanguage.languageCode)
            .format(DateTime.parse(date));
    return formattedDate;
  }

  static String formatTime(int hour, int minute) {
    String h = hour < 10 ? "0$hour" : "$hour";
    String m = minute < 10 ? "0$minute" : "$minute";
    return "$h:$m";
  }

  static String formattedDateTow(String date) {
    var formattedDate =
        DateFormat('MMM d, yyyy', LanguageManager.defaultLanguage.languageCode)
            .format(DateTime.parse(date));
    return formattedDate;
  }

  //   String townName;
  //    String buildingName;
  //    int apartmentNumber;
  static String createCustomerReferenceForActivatePayment(
      String stickerNumber, String apartmentNumber, String townName) {
    return "$stickerNumber-$apartmentNumber-$townName";
  }

  static String timeFromSeconds(int seconds, [bool minWidth4 = false]) {
    if (seconds == 0) return "0:00";

    String result = DateFormat('HH:mm:ss').format(
      DateTime(2022, 1, 1, 0, 0, seconds),
    );

    List resultParts = result.split(':');
    for (int i = 0; i < resultParts.length; i++) {
      if (resultParts[i] != "00") break;
      resultParts[i] = "";
    }
    resultParts.removeWhere((element) => element == "");

    if (minWidth4 && resultParts.length == 1) {
      resultParts = ["0", ...resultParts];
    }

    return resultParts.join(':');
  }

  static String formattedTimestamp(int isoDate,
      [bool timeOnly = false, bool meridiem = false]) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(isoDate, isUtc: true);

    if (timeOnly || datesHaveSameDay(now, date)) {
      return meridiem
          ? DateFormat('hh:mm a', "en_US").format(date)
          : DateFormat('HH:mm', "en_US").format(date);
    }

    // if (isYesterday(date)) {
    //   return 'Yesterday';
    // }

    return DateFormat.yMd("en_US").format(date);
  }

  static String dateFromTimestamp(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime date = dateTime;

    if (datesHaveSameDay(now, date)) {
      return 'Today';
    }

    if (isYesterday(date)) {
      return 'Yesterday';
    }

    return DateFormat.yMd().format(date);
  }

  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return datesHaveSameDay(date, yesterday);
  }

  static bool datesHaveSameDay(DateTime d1, DateTime d2) {
    return d1.day == d2.day && d1.month == d2.month && d1.year == d2.year;
  }
}
