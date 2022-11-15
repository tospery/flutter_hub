import 'package:flutter_hub/module/language/language_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
