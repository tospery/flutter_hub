import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class ProfileController extends HiListController<HiModel> {
  @override
  void onInit() {
    super.onInit();
    // ever(count1, (_) => print("$_ has been changed"));
    // ever(user, _userUpdate);
  }

  @override
  void requestData({required HiRequestMode mode}) {
    items.clear();
    items.add(HiSimple(
      id: CellId.nickname.instanceName,
      title: CellId.nickname.instanceName.tr,
      detail: user.value.username,
    ));
    items.add(HiSimple(
      id: CellId.bio.instanceName,
      title: CellId.bio.instanceName.tr,
      detail: user.value.real.bio,
    ));
    items.add(const HiSimple(
      height: 15,
    ));
    items.add(HiSimple(
      id: CellId.company.instanceName,
      title: CellId.company.instanceName.tr,
      detail: user.value.real.company,
    ));
    items.add(HiSimple(
      id: CellId.location.instanceName,
      title: CellId.location.instanceName.tr,
      detail: user.value.real.location,
    ));
    items.add(HiSimple(
      id: CellId.blog.instanceName,
      title: CellId.blog.instanceName.tr,
      detail: user.value.real.blog,
    ));
    items.add(const HiSimple(
      height: 15,
    ));
    items.add(HiSimple(
      title: R.strings.logout.tr,
    ));
    finish(items: items);
  }

  void logout() {
    const User().save(isReactive: true);
    Get.back();
  }

  // _userUpdate(HiUser user) {
  //   log('user changed: ${user.real.bio}');
  //   reloadData();
  // }

  // @override
  // void updateUser(HiUser user) {
  //   super.updateUser(user);
  //   reloadData();
  // }
}
