import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_mail/core/utils/colors.dart';
import 'package:riseup_mail/core/widgets/global_appbar.dart';
import 'package:riseup_mail/core/widgets/global_bottom_button.dart';
import 'package:riseup_mail/core/widgets/global_text_field.dart';
import 'package:riseup_mail/features/sign_in/presentation/widgets/sign_in_animation.dart';
import 'package:riseup_mail/features/sign_up/presentation/controller/controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const GlobalAppBar(),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 40),
                    const TopAnimation(isSignIn: false),
                    const SizedBox(height: 70),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Please '),
                          TextSpan(text: 'enter details ', style: Get.textTheme.headline5?.copyWith(color: CustomColor.blue)),
                          const TextSpan(text: 'first to continue '),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline5,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Domain',
                      style: Get.textTheme.headline5,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(Container(
                            height: Get.height,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    '@${controller.domains[index].domain}',
                                    style: Get.textTheme.headline5,
                                  ),
                                  onTap: () {
                                    controller.selectedDomainIndex.value = index;
                                    Get.back();
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                );
                              },
                              itemCount: controller.domains.length,
                            )));
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColor.grey3,
                        ),
                        child: Text(
                          '@${controller.domains[controller.selectedDomainIndex.value].domain}',
                          style: Get.textTheme.headline6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Email Username',
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
                    const SizedBox(height: 50),
                    GlobalBottomButton(
                        onPressed: () {
                          controller.signUp();
                        },
                        text: 'Sign up',
                        isSolidButton: true),
                    const SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}
