import 'package:riseup_mail/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/usecase/usecase.dart';
import 'package:riseup_mail/features/sign_up/domain/repositories/sign_up_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final SignUpRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  @override
  Future<Either<Failure, void>> call(SignUpParams params) {
    return signUpRepository.signUp(email: params.email, password: params.password);
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
