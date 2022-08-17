import 'package:get/instance_manager.dart';
import 'package:riseup_mail/features/mails/domain/usecases/get_all_mails_usecase.dart';
import 'package:riseup_mail/features/mails/presentation/controller/controller.dart';
import 'package:riseup_mail/features/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:riseup_mail/features/sign_in/presentation/controller/controller.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/get_domains_usecase.dart';
import 'package:riseup_mail/features/sign_up/domain/usecases/sign_up_usecase.dart';
import 'package:riseup_mail/features/sign_up/presentation/controller/controller.dart';
import 'package:riseup_mail/injection_container.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<RegistrationController>(() => RegistrationController(registrationRepository: sl<RegistrationRepository>()), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(getDomainsUsecase: sl<GetDomainsUsecase>(), signUpUseCase: sl<SignUpUseCase>()));
    Get.lazyPut<SignInController>(() => SignInController(signInUseCase: sl<SignInUseCase>()));
    Get.lazyPut<MailsController>(() => MailsController(getAllMailsUseCase: sl<GetAllMailsUseCase>()));
  }
}
