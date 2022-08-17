import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_mail/core/utils/colors.dart';
import 'package:riseup_mail/features/mails/presentation/controller/controller.dart';
import 'package:riseup_mail/features/mails/presentation/widgets/mail_tile.dart';

class MailScreen extends GetView<MailsController> {
  const MailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inbox',
                style: Get.textTheme.headline2?.copyWith(fontSize: 36),
              ),
              InkWell(
                onTap: () {
                  controller.logOut();
                },
                child: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MailTile(
                      controller: controller,
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                      color: CustomColor.grey3,
                    );
                  },
                  itemCount: controller.mails.length),
        ),
      ],
    ));
  }
}
