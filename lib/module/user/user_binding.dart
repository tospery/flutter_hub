import 'package:flutter_hub/module/user/user_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
