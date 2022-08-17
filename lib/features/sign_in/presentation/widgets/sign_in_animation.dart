import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAnimation extends StatelessWidget {
  const TopAnimation({
    required this.isSignIn,
    Key? key,
  }) : super(key: key);

  final isSignIn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        style: Get.textTheme.headline2!,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'RiseUp Mail',
              speed: const Duration(milliseconds: 200),
            ),
            TypewriterAnimatedText(
              'Create New Mail',
              speed: const Duration(milliseconds: 200),
            ),
            TypewriterAnimatedText(
              isSignIn ? 'Sign In' : 'Sign Up',
              speed: const Duration(milliseconds: 200),
            )
          ],
        ),
      ),
    );
  }
}
