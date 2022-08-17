import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/features/mails/presentation/controller/controller.dart';
import 'package:riseup_mail/features/mails/presentation/pages/index.dart';
import 'package:riseup_mail/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:riseup_mail/initial_binding.dart';

class SignInController extends GetxController {
  final SignInUseCase signInUseCase;

  SignInController({required this.signInUseCase});

  final RxBool isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    if (!validateRegistrationFields()) {
      return;
    }

    isLoading.value = true;

    final result = await signInUseCase.call(SignInParams(
      email: emailController.text,
      password: passwordController.text,
    ));

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar(
            'No connection',
            'Please check your internet connection',
          );
        } else if (l is AuthorizationFailure) {
          Get.snackbar(
            'Authorization failed',
            'Email or password is incorrect',
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
          );
        }
      },
      (r) {
        Get.snackbar('Welcome', 'You are successfully signned in ');
        Get.delete<MailsController>();
        Get.offAll(() => const MailScreen(), binding: InitialBinding());
      },
    );

    isLoading.value = false;
  }

  bool validateRegistrationFields() {
    if (emailController.text.isEmpty) {
      Get.snackbar('Email field is empty', 'Fill up the email field');
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Email error',
        'Email format is not correct',
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
      );
      return false;
    }
    if (passwordController.text.length < 6) {
      Get.snackbar('Password Error', 'Password have to be at least 6 characters');
      return false;
    }
    return true;
  }
}
