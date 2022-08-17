import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/network/network_info.dart';
import 'package:riseup_mail/features/mails/data/datasources/mails_remote_datasource.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:riseup_mail/features/mails/domain/repositories/mails_repo.dart';

class MailsRepositoryImpl extends MailsRepository {
  final MailsRemoteDataSource mailsRemoteDataSource;
  final NetworkInfo networkInfo;

  MailsRepositoryImpl({required this.mailsRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Mail>>> getMails({required String page}) async {
    if (await networkInfo.isConnected) {
      try {
        final mails = await mailsRemoteDataSource.getMails(page: page);
        return Right(mails);
      } on ServerException {
        return Left(ServerFailure());
      } on AuthorizationException {
        return Left(AuthorizationFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
