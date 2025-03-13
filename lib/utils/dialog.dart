import 'package:e_election/app/theme/app_colors.dart';
import 'package:e_election/app/widgets/loading.dart';
import 'package:flutter/material.dart';

class UtilDialog {
  static showInformation(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? content,
    Function()? onClose,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          icon: icon ??
              Icon(Icons.info_outline, color: AppColor.primaryColor, size: 50),
          title: Text(
            title ?? "message_for_you",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          content: Text(content!),
          actions: const <Widget>[
            // SecondaryButton(
            //   title: LocaleKeys.cancel.tr(),
            //   height: 40,
            //   onTap: onClose ?? () => Navigator.of(context).pop(),
            // ),
          ],
        );
      },
    );
  }

  static showWaiting(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            alignment: Alignment.center,
            child: Loading(color: Colors.white),
          ),
        );
      },
    );
  }

  static hideWaiting(BuildContext context) {
    print("hideWaiting");
    Navigator.pop(context);
  }

  static Future<bool?> showConfirmation(
    BuildContext context, {
    String? title,
    required Widget content,
    String confirmButtonText = "Yes",
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title ?? "message_for_you",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              child: const Text(
                "close",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              style: TextButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),
              child: Text(
                confirmButtonText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
