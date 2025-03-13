import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoradingItemWidget extends StatelessWidget {
  final String? imageLink;
  final String? title;
  final String? content;

  const OnBoradingItemWidget({
    Key? key,
    this.imageLink,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Image.network(
            imageLink!,
            height: 0.2.sh, // 30% of screen height
            width: 0.4.sw, // 40% of screen width
            fit: BoxFit.contain,
          ),
          SizedBox(height: 40.h),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 0.8.sw, // 80% of screen width
            ),
            child: Text(
              content!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
