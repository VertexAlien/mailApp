import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:riseup_mail/core/utils/colors.dart';
import 'package:riseup_mail/features/mails/presentation/controller/controller.dart';

class MailTile extends StatelessWidget {
  const MailTile({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final MailsController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
            width: 25,
            child: Icon(
              CupertinoIcons.circle_fill,
              color: controller.mails[index].seen ? Colors.white : Colors.blue,
              size: 12,
            ),
          ),
          Container(
            width: Get.width - 25,
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.mails[index].from.name ?? controller.mails[index].from.address,
                      style: Get.textTheme.headline4,
                    ),
                    Row(
                      children: [
                        Text(
                          // '9/14/22',
                          DateFormat('dd/MM/yy').format(controller.mails[index].createdAt),
                          style: Get.textTheme.headline5?.copyWith(color: CustomColor.grey4),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: CustomColor.grey2,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  controller.mails[index].subject,
                  style: Get.textTheme.headline6,
                ),
                const SizedBox(height: 5),
                Text(
                  controller.mails[index].intro,
                  style: Get.textTheme.headline6?.copyWith(color: CustomColor.grey2),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
