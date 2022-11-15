import 'package:flutter_hub/module/about/about_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
