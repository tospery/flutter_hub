import 'package:flutter_hub/module/oauth/oauth_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class OauthBinding extends HiWebBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OauthController>(() => OauthController());
  }
}
