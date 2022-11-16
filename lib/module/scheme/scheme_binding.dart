import 'package:flutter_hub/module/scheme/scheme_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class SchemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchemeController>(() => SchemeController());
  }
}