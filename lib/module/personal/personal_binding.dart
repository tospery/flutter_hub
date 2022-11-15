import 'package:flutter_hub/module/personal/personal_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
