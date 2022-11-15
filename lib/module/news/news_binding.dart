import 'package:flutter_hub/module/news/news_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
  }
}
