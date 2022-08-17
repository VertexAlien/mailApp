import 'package:riseup_mail/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/usecase/usecase.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';
import 'package:riseup_mail/features/mails/domain/repositories/mails_repo.dart';

class GetAllMailsUseCase implements UseCase<List<Mail>, String> {
  final MailsRepository mailsRepo;

  GetAllMailsUseCase({required this.mailsRepo});

  @override
  Future<Either<Failure, List<Mail>>> call(String params) {
    return mailsRepo.getMails(page: params);
  }
}
