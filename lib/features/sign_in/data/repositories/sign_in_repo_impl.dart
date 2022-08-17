import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/network/network_info.dart';
import 'package:riseup_mail/features/sign_in/data/datasources/sign_in_remote_datasource.dart';
import 'package:riseup_mail/features/sign_in/domain/repositories/sign_in_repo.dart';

class SignInRepositoryImpl extends SignInRepository {
  final NetworkInfo networkInfo;
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> signIn({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signIn(email: email, password: password);
        return const Right(null);
      } on AuthorizationException {
        return Left(AuthorizationFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
