import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/error/failures.dart';

abstract class SignInRepository {
  Future<Either<Failure, void>> signIn({required String email, required String password});
}
