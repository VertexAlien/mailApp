import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/get_domains_usecase.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/sign_up_usecase.dart';

class SignUpController extends GetxController {
  final GetDomainsUsecase getDomainsUsecase;
  final SignUpUseCase signUpUseCase;

  SignUpController({required this.getDomainsUsecase, required this.signUpUseCase});

  RxBool isLoading = false.obs;

  RxList<Domain> domains = <Domain>[].obs;

  RxInt selectedDomainIndex = 0.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getDomains() async {
    isLoading.value = true;

    final result = await getDomainsUsecase.call(null);

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar(
            'No connection',
            'Please check your internet connection',
            backgroundColor: Colors.red,
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: Colors.red,
          );
        }
      },
      (r) => domains.value = r,
    );

    isLoading.value = false;
  }

  Future<void> signUp() async {
    isLoading.value = true;

    if (!validateRegistrationFields()) {
      isLoading.value = false;
      return;
    }

    final result = await signUpUseCase.call(SignUpParams(email: '${emailController.text}@${domains[selectedDomainIndex.value].domain}', password: passwordController.text));

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar(
            'No connection',
            'Please check your internet connection',
            backgroundColor: Colors.redAccent,
          );
        } else if (l is AuthorizationFailure) {
          Get.snackbar(
            'Mail already exists',
            'Please try with another username',
            backgroundColor: Colors.redAccent,
          );
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: Colors.redAccent,
          );
        }
      },
      (r) {
        Get.back();
        Get.snackbar(
          'Success',
          'Email created',
          backgroundColor: Colors.green,
        );
      },
    );

    isLoading.value = false;
  }

  bool validateRegistrationFields() {
    if (emailController.text.isEmpty) {
      Get.snackbar('Email field is empty', 'Fill up the email field');
      return false;
    }
    if (!GetUtils.isEmail('${emailController.text}@${domains[selectedDomainIndex.value].domain}')) {
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

  @override
  void onInit() {
    getDomains();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
