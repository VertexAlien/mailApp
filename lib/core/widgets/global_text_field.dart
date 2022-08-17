import 'package:flutter/material.dart';
import 'package:riseup_mail/core/utils/colors.dart';


class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.isPassword = false,
    this.onShowPasswordTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  final VoidCallback? onShowPasswordTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: CustomColor.grey3,
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: onShowPasswordTap,
                  child: const Icon(Icons.remove_red_eye),
                )
              : null,
        ),
        controller: controller,
        obscureText: obscureText,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
      ),
    );
  }
}
