import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/features/mails/data/models/mail_model.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';

abstract class MailsRepository {
  Future<Either<Failure, List<Mail>>> getMails({required String page});
}
