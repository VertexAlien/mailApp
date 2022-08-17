import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riseup_mail/core/utils/colors.dart';
import 'package:riseup_mail/core/widgets/global_bottom_button.dart';
import 'package:riseup_mail/core/widgets/global_text_field.dart';
import 'package:riseup_mail/features/sign_in/presentation/controller/controller.dart';
import 'package:riseup_mail/features/sign_in/presentation/widgets/sign_in_animation.dart';
import 'package:riseup_mail/features/sign_up/presentation/pages/index.dart';
import 'package:riseup_mail/initial_binding.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 80),
            const TopAnimation(
              isSignIn: true,
            ),
            const SizedBox(height: 80),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Please '),
                  TextSpan(text: 'sign in ', style: Get.textTheme.headline5?.copyWith(color: CustomColor.blue)),
                  const TextSpan(text: 'first to continue '),
                ],
              ),
              textAlign: TextAlign.center,
              style: Get.textTheme.headline5,
            ),
            const SizedBox(height: 40),
            Text(
              'Email',
              style: Get.textTheme.headline5,
            ),
            const SizedBox(height: 20),
            GlobalTextField(
              controller: controller.emailController,
            ),
            const SizedBox(height: 20),
            Text(
              'Password',
              style: Get.textTheme.headline5,
            ),
            const SizedBox(height: 20),
            GlobalTextField(
              controller: controller.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            GlobalBottomButton(
                onPressed: () {
                  controller.signIn();
                },
                text: 'Sign in',
                isSolidButton: true),
            const SizedBox(height: 20),
            Text(
              'Don’t have a mail account yet?',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            GlobalBottomButton(
              text: 'Create new Mail',
              onPressed: () {
                Get.to(() => const SignUpScreen(), binding: InitialBinding());
              },
              isSolidButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
