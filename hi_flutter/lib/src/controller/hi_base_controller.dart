import 'dart:async';

import 'package:get/get.dart';
import '../core/constant.dart';
import '../core/parameter.dart';
import '../extension/map.dart';
import '../model/hi_user.dart';
import '../utils/hi_provider.dart';
import '../model/hi_configuration.dart';

class HiBaseController extends GetxController {
  /// title通常不可变，故使用非响应式，如果需要变，则在具体controller中实现响应式的title
  String? title;
  late Map<String, dynamic> parameters;
  late Rx<HiUser> user;
  late HiConfiguration configuration;
  late HiProvider provider;
  late StreamSubscription eventSubscription;

  @override
  void onInit() {
    super.onInit();
    parameters = Get.parameters;
    if (Get.arguments != null) {
      if (Get.arguments is Map<String, dynamic>) {
        parameters += Get.arguments;
      } else {
        parameters[HiParameter.arguments] = Get.arguments;
      }
    }
    title = parameters.stringForKey(HiParameter.title);
    user = Get.find<HiUser>().obs;
    configuration = Get.find<HiConfiguration>();
    provider = Get.find<HiProvider>();
    eventSubscription = eventBus.on().listen((event) {
      if (event is HiUser) {
        updateUser(event);
      }
    });
  }

  @override
  void dispose() {
    eventSubscription.cancel();
    super.dispose();
  }

  void updateUser(HiUser user) {
    this.user.value = user;
    update();
  }
}
