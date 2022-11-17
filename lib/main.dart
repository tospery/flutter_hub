import 'package:flutter/material.dart';
import 'package:flutter_hub/core/injection.dart';
import 'package:flutter_hub/core/routes.dart';
import 'package:flutter_hub/core/theme.dart';
import 'package:flutter_hub/module/splash/splash_binding.dart';
import 'package:flutter_hub/module/splash/splash_page.dart';
import 'package:flutter_hub/resource/translations.dart';
import 'package:hi_flutter/hi_flutter.dart';

//final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.ready();
  runApp(
    GetMaterialApp(
      //navigatorKey: Get.key,
      enableLog: true,
      logWriterCallback: (text, {bool isError = false}) {
        Future.microtask(() => log('$text, isError = $isError'));
      },
      debugShowCheckedModeBanner: false,
      getPages: Routes.getPages,
      // initialRoute: '/',
      // builder: (context, child) => Scaffold(
      //   // Global GestureDetector that will dismiss the keyboard
      //   body: GestureDetector(
      //     onTap: () {
      //       KeyboardUtils.hideKeyboard(context);
      //     },
      //     child: child,
      //   ),
      // ),
      defaultTransition: Transition.native,
      initialBinding: SplashBinding(),
      home: const SplashPage(),
      theme: AppThemeData.defaultThemeData(Colors.blue),
      locale: AppTranslations.locale,
      fallbackLocale: AppTranslations.fallbackLocale,
      translations: AppTranslations(),
      // builder: EasyLoading.init(),
    ),
  );
}
