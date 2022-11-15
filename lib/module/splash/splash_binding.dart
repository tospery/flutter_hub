import 'package:flutter_hub/module/splash/splash_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
