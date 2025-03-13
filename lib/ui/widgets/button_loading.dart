import 'package:e_election/app/theme/app_colors.dart';
import 'package:e_election/app/theme/styles.dart';
import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final double height;
  final double radius;

  const BoxButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    this.height = 48,
    this.radius = 8,
  })  : outline = false,
        super(key: key);

  const BoxButton.outline(
      {required this.title,
      this.onTap,
      this.leading,
      this.height = 48,
      this.radius = 8})
      : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          overlayColor:
              getColor(AppColor.primaryColor, AppColor.primaryColorTransparent),
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
              disabled && !busy
                  ? AppColor.buttonDesibleColor
                  : AppColor.primaryColor)),
      onPressed: disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColor.primaryColor,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) SizedBox(width: 5),
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline ? Colors.white : AppColor.primaryColor,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color normalColor, Color pressedColor) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return pressedColor;
      } else {
        return normalColor;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}
