import 'package:e_election/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilToast {
  static void showMessageForUser(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.4),
      textColor: Colors.white,
      fontSize: 14.sp,
    );
  }

  static void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.successColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.errorColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            const Icon(
              Icons.error_rounded,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    ));
  }

  static void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.infoColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
