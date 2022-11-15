import 'package:flutter_hub/index.dart';
import 'package:flutter_hub/provider/provider.dart';
import 'package:hi_flutter/hi_flutter.dart';

class UserController extends HiListController<HiModel> {
  var current = const User().obs;

  @override
  void onInit() {
    super.onInit();
    enablePullRefresh = Get.parameters.boolForKey(HiParameter.canRefresh) ?? true;
  }

  @override
  void requestData({required HiRequestMode mode}) async {
    var username = Get.parameters.stringForKey(HiParameter.username) ?? '';
    if (username != user.value.username) {
      current.value = await provider.user(username);
    } else {
      if (mode == HiRequestMode.loading) {
        current.value = user.value as User;
      } else {
        current.value = await provider.user(username);
      }
    }
    items.clear();
    items.addAll([
      HiModel(id: CellId.userInfo.instanceName),
      const HiSimple(height: 10),
      HiModel(id: CellId.userStat.instanceName),
      const HiSimple(height: 10),
      HiSimple(
        id: CellId.company.instanceName,
        title: current.value.company ?? R.strings.noDescription.tr,
        icon: R.assets.images.companyIcon,
        indicated: current.value.company?.isNotEmpty ?? false,
      ),
      HiSimple(
        id: CellId.location.instanceName,
        title: current.value.location ?? R.strings.noDescription.tr,
        icon: R.assets.images.locationIcon,
        indicated: false,
      ),
      HiSimple(
        id: CellId.email.instanceName,
        title: current.value.email ?? R.strings.noDescription.tr,
        icon: R.assets.images.emailIcon,
        indicated: current.value.email?.isNotEmpty ?? false,
      ),
      HiSimple(
        id: CellId.blog.instanceName,
        title: current.value.blog ?? R.strings.noDescription.tr,
        icon: R.assets.images.blogIcon,
        indicated: current.value.blog?.isNotEmpty ?? false,
        separated: false,
      ),
    ]);
    finish(items: items);
  }
}
