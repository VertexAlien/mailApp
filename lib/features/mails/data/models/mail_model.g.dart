// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailModel _$MailModelFromJson(Map<String, dynamic> json) => MailModel(
      id: json['id'] as String,
      from: FromToModel.fromJson(json['from'] as Map<String, dynamic>),
      to: (json['to'] as List<dynamic>)
          .map((e) => FromToModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String,
      intro: json['intro'] as String,
      seen: json['seen'] as bool,
      isDeleted: json['isDeleted'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MailModelToJson(MailModel instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toJson(),
      'to': instance.to.map((e) => e.toJson()).toList(),
      'subject': instance.subject,
      'intro': instance.intro,
      'seen': instance.seen,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
    };
