import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class PersonalController extends HiBaseController {
  RxList<HiModel> items = <HiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    reloadData();
  }

  @override
  void updateUser(HiUser user) {
    super.updateUser(user);
    reloadData();
  }

  void headerPressed() async {
    if (!user.value.isValid) {
      Get.offNamed(Routes.login);
      return;
    }
    var result = await Get.toNamed(Routes.profile);
    log('return value: $result');
  }

  void reloadData() {
    items.clear();
    if (user.value.isValid) {
      items.addAll([
        user.value.real.copyWith(cellType: UserCellType.chart),
        const HiSimple(
          height: 15,
        ),
        HiSimple(
          id: CellId.company.instanceName,
          icon: R.assets.images.companyIcon,
          title: user.value.real.company,
          indicated: false,
        ),
        HiSimple(
          id: CellId.location.instanceName,
          icon: R.assets.images.locationIcon,
          title: user.value.real.location,
          indicated: false,
        ),
        HiSimple(
          id: CellId.email.instanceName,
          icon: R.assets.images.emailIcon,
          title: user.value.real.email,
          indicated: false,
        ),
        HiSimple(
          id: CellId.blog.instanceName,
          icon: R.assets.images.blogIcon,
          title: user.value.real.blog,
          separated: false,
        ),
        const HiSimple(
          height: 15,
        ),
      ]);
    }
    items.addAll([
      HiSimple(
        id: CellId.setting.instanceName,
        icon: R.assets.images.settingIcon,
        title: R.strings.setting.tr,
      ),
      HiSimple(
        id: CellId.about.instanceName,
        icon: R.assets.images.aboutIcon,
        title: R.strings.about.tr,
      ),
      HiSimple(
        id: CellId.feedback.instanceName,
        icon: R.assets.images.feedbackIcon,
        title: R.strings.feedback.tr,
        separated: false,
      ),
    ]);
    update();
  }
}
