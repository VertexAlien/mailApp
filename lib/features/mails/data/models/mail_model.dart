import 'package:json_annotation/json_annotation.dart';
import 'package:riseup_mail/features/mails/data/models/fromto_model.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';

part 'mail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MailModel extends Mail {
  const MailModel({
    required String id,
    required FromToModel from,
    required List<FromToModel> to,
    required String subject,
    required String intro,
    required bool seen,
    required bool isDeleted,
    required DateTime createdAt,
  }) : super(
          id: id,
          from: from,
          to: to,
          subject: subject,
          intro: intro,
          seen: seen,
          isDeleted: isDeleted,
          createdAt: createdAt,
        );

  factory MailModel.fromJson(Map<String, dynamic> json) => _$MailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MailModelToJson(this);
}
