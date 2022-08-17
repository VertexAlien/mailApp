import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';

abstract class SignUpRepository {
  Future<Either<Failure, List<Domain>>> getDomains();
  Future<Either<Failure, void>> signUp({required String email, required String password});
}
