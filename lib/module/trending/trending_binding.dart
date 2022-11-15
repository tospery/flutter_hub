import 'package:flutter_hub/module/trending/trending_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(() => TrendingController());
  }
}
