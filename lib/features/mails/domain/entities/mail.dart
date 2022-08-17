import 'package:equatable/equatable.dart';
import 'package:riseup_mail/features/mails/data/models/fromto_model.dart';
import 'package:riseup_mail/features/mails/domain/entities/fromto.dart';

class Mail extends Equatable {
  final String id;
  final FromToModel from;
  final List<FromToModel> to;
  final String subject;
  final String intro;
  final bool seen;
  final bool isDeleted;
  final DateTime createdAt;

  const Mail({
    required this.id,
    required this.from,
    required this.to,
    required this.subject,
    required this.intro,
    required this.seen,
    required this.isDeleted,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        from,
        to,
        subject,
        intro,
        seen,
        isDeleted,
        createdAt,
      ];
}
