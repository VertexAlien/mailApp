import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/error/exceptions.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/core/network/network_info.dart';
import 'package:riseup_mail/features/sign_up/data/datasources/sign_up_remote_datasource.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';
import 'package:riseup_mail/features/sign_up/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final NetworkInfo networkInfo;
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Domain>>> getDomains() async {
    if (await networkInfo.isConnected) {
      try {
        final domains = await remoteDataSource.getDomains();
        return Right(domains);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUp({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.signUp(email: email, password: password);
        return const Right(null);
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
