import 'package:riseup_mail/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:riseup_mail/core/usecase/usecase.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';
import 'package:riseup_mail/features/sign_up/domain/repositories/sign_up_repository.dart';

class GetDomainsUsecase implements UseCase<List<Domain>, void> {
  final SignUpRepository signUpRepository;

  GetDomainsUsecase({required this.signUpRepository});

  @override
  Future<Either<Failure, List<Domain>>> call(void params) {
    return signUpRepository.getDomains();
  }
}
