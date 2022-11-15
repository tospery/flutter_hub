import 'package:get/get.dart';
import 'package:hi_flutter/src/extension/map.dart';
import 'package:hi_flutter/src/core/parameter.dart';
import '../controller/hi_base_controller.dart';

class HiWebController extends HiBaseController {
  var isLoading = true.obs;
  var title = ''.obs;
  var url = ''.obs;

  @override
  void onInit() {
    super.onInit();
    var arguments = Get.arguments as Map<String, dynamic>? ?? {};
    title.value = arguments.stringForKey(HiParameter.title) ?? '';
    url.value = arguments.stringForKey(HiParameter.url) ?? '';
  }

  void loadFinished() {
    isLoading.value = false;
    update();
  }
}
