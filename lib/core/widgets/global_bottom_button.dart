import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:riseup_mail/core/utils/colors.dart';

class GlobalBottomButton extends StatelessWidget {
  const GlobalBottomButton({
    required this.text,
    this.icon,
    required this.onPressed,
    required this.isSolidButton,
    this.isFirstIcon = true,
    this.size = 55,
    this.color = CustomColor.pink,
    this.style,
    this.borderRaius = 10,
    this.space = 10,
  });

  final String text;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool isSolidButton;
  final bool isFirstIcon;
  final double size;
  final Color color;
  final TextStyle? style;
  final double borderRaius;
  final double space;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPressed,
      // textStyle: isSolidButton ? Get.textTheme.button : Get.textTheme.button?.copyWith(color: Colors.black),
      size: size,
      color: color,
      fullWidthButton: true,
      borderShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRaius),
        side: isSolidButton
            ? BorderSide.none
            : BorderSide(
                color: color,
              ),
      ),
      type: isSolidButton ? GFButtonType.solid : GFButtonType.outline,
      // text: text,
      // icon: icon,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && isFirstIcon) icon! else Container(),
          if (icon != null && isFirstIcon) SizedBox(width: space) else Container(),
          Text(
            text,
            // ignore: prefer_if_null_operators
            style: style != null
                ? style
                : isSolidButton
                    ? Get.textTheme.button
                    : Get.textTheme.button?.copyWith(color: Colors.black),
          ),
          if (icon != null && !isFirstIcon) SizedBox(width: space) else Container(),
          if (icon != null && !isFirstIcon) icon! else Container(),
        ],
      ),
    );
  }
}
