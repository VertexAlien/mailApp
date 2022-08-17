// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailModel _$MailModelFromJson(Map<String, dynamic> json) => MailModel(
      id: json['id'] as String,
      type: json['type'] as String,
      categoryModelId: json['categoryModelId'] as String,
      accountId: json['accountId'] as String,
      msgid: json['msgid'] as String,
      from: FromToModel.fromJson(json['from'] as Map<String, dynamic>),
      to: (json['to'] as List<dynamic>)
          .map((e) => FromToModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String,
      intro: json['intro'] as String,
      seen: json['seen'] as bool,
      isDeleted: json['isDeleted'] as bool,
      hasAttachments: json['hasAttachments'] as bool,
      size: json['size'] as int,
      downloadUrl: json['downloadUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MailModelToJson(MailModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'categoryModelId': instance.categoryModelId,
      'accountId': instance.accountId,
      'msgid': instance.msgid,
      'from': instance.from.toJson(),
      'to': instance.to.map((e) => e.toJson()).toList(),
      'subject': instance.subject,
      'intro': instance.intro,
      'seen': instance.seen,
      'isDeleted': instance.isDeleted,
      'hasAttachments': instance.hasAttachments,
      'size': instance.size,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
