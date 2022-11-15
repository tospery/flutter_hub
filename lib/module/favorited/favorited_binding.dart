import 'package:flutter_hub/module/favorited/favorited_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class FavoritedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritedController>(() => FavoritedController());
  }
}
