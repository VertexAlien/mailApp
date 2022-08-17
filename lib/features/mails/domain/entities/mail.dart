import 'package:equatable/equatable.dart';
import 'package:riseup_mail/features/mails/data/models/fromto_model.dart';
import 'package:riseup_mail/features/mails/domain/entities/fromto.dart';

class Mail extends Equatable {
  final String id;
  final String type;
  final String categoryModelId;
  final String accountId;
  final String msgid;
  final FromToModel from;
  final List<FromToModel> to;
  final String subject;
  final String intro;
  final bool seen;
  final bool isDeleted;
  final bool hasAttachments;
  final int size;
  final String downloadUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Mail({
    required this.id,
    required this.type,
    required this.categoryModelId,
    required this.accountId,
    required this.msgid,
    required this.from,
    required this.to,
    required this.subject,
    required this.intro,
    required this.seen,
    required this.isDeleted,
    required this.hasAttachments,
    required this.size,
    required this.downloadUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        categoryModelId,
        accountId,
        msgid,
        from,
        to,
        subject,
        intro,
        seen,
        isDeleted,
        hasAttachments,
        size,
        downloadUrl,
        createdAt,
        updatedAt,
      ];
}
