import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/core/usecase/usecase.dart';
import 'package:riseup_mail/features/sign_in/domain/repositories/sign_in_repo.dart';

class SignInUseCase implements UseCase<void, SignInParams> {
  final SignInRepository signInRepository;
  SignInUseCase({required this.signInRepository});
  @override
  Future<Either<Failure, void>> call(SignInParams params) {
    return signInRepository.signIn(email: params.email, password: params.password);
  }
}

class SignInParams {
  final String email;
  final String password;
  SignInParams({required this.email, required this.password});
}
