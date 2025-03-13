import 'package:e_election/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  Color color;

  Loading({super.key, this.color = AppColor.primaryColor});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}

class LoadingWhite extends StatelessWidget {
  const LoadingWhite({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.White),
        ),
      ),
    );
  }
}

class SpintLoading extends StatelessWidget {
  const SpintLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: SpinKitCircle(
          color: AppColor.primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
