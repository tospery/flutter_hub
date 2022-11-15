import 'package:flutter_hub/module/login/login_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
