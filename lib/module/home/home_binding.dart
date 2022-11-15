import 'package:flutter_hub/module/trending/trending_controller.dart';
import 'package:flutter_hub/module/favorited/favorited_controller.dart';
import 'package:flutter_hub/module/news/news_controller.dart';
import 'package:flutter_hub/module/personal/personal_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(() => TrendingController());
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<FavoritedController>(() => FavoritedController());
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
