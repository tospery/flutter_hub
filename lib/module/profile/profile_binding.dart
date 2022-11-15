import 'package:flutter_hub/module/profile/profile_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
