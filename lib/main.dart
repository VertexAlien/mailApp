import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riseup_mail/core/utils/theme.dart';
import 'package:riseup_mail/features/mails/presentation/pages/index.dart';
import 'package:riseup_mail/features/sign_in/presentation/pages/index.dart';
import 'package:riseup_mail/initial_binding.dart';
import 'package:riseup_mail/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('bn'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      theme: CustomTheme().mainTheme,
      // home: const SignInScreen(),
      home: const MailScreen(),
    );
  }
}
