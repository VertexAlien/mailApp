import 'package:get/get.dart';
import 'package:riseup_mail/core/error/failures.dart';
import 'package:riseup_mail/features/mails/domain/entities/mail.dart';
import 'package:riseup_mail/features/mails/domain/usecases/get_all_mails_usecase.dart';
import 'package:riseup_mail/features/sign_in/presentation/pages/index.dart';
import 'package:riseup_mail/initial_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MailsController extends GetxController {
  final GetAllMailsUseCase getAllMailsUseCase;

  MailsController({required this.getAllMailsUseCase});

  RxBool isLoading = false.obs;

  RxList<Mail> mails = RxList<Mail>();

  Future<void> getAllMails() async {
    isLoading.value = true;

    final result = await getAllMailsUseCase.call('1');

    result.fold(
      (l) {
        if (l is NoConnectionFailure) {
          Get.snackbar('No Connection', 'Please check your internet ');
        } else if (l is ServerFailure) {
          Get.snackbar(
            'Error',
            'Something went wrong',
          );
        } else {
          Get.offAll(() => const SignInScreen(), binding: InitialBinding());
        }
      },
      (r) => mails.value = r,
    );

    isLoading.value = false;
  }

  Future<void> logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Get.offAll(() => const SignInScreen(), binding: InitialBinding());
  }

  @override
  void onInit() {
    getAllMails();
    super.onInit();
  }
}
