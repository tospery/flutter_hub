import 'dart:async';

import 'package:get/get.dart';
import '../core/constant.dart';
import '../model/hi_user.dart';
import '../utils/hi_provider.dart';
import '../model/hi_configuration.dart';

class HiBaseController extends GetxController {
  late Rx<HiUser> user;
  late HiConfiguration configuration;
  late HiProvider provider;
  late StreamSubscription eventSubscription;

  @override
  void onInit() {
    super.onInit();
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
