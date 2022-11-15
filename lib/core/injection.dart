import 'package:flutter_hub/model/configuration.dart';
import 'package:flutter_hub/model/user.dart';
import 'package:flutter_hub/provider/github_api_service.dart';
import 'package:flutter_hub/provider/github_main_service.dart';
import 'package:flutter_hub/provider/provider.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:flutter_hub/provider/trending_service.dart';

class Injection {
  static Future<void> ready() async {
    await HiFlutter.ready();
    // 配置
    Get.lazyPut<HiConfiguration>(() {
      var string = HiCache.shared().get<String>(HiKey.configuration);
      var json = string?.toJsonObject();
      var configuration = Configuration.fromJson(
        json ??
            {
              'dataKeys': ['data', 'access_token']
            },
      );
      log('configuration: ${configuration.toJsonString()}');
      return configuration;
    });
    // 用户
    // Get.lazyPut<HiUser>(() => User.myDefault());
    Get.put<HiUser>(User.myDefault(), permanent: true);
    // 网络服务
    Get.lazyPut(() => TrendingService());
    Get.lazyPut(() => GithubMainService());
    Get.lazyPut(() => GithubApiService());
    Get.lazyPut<HiProvider>(
      () => Provider(
        trendingService: Get.find(),
        githubMainService: Get.find(),
        githubApiService: Get.find(),
      ),
    );
  }

  static putUser(User user) {
    HiCache.shared().remove(HiKey.user);
    Get.lazyPut<HiUser>(() => user);
  }
}
