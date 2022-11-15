import 'package:flutter/material.dart';
import 'package:flutter_hub/index.dart';
import 'package:flutter_hub/module/profile/profile_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

class ProfilePage extends HiListPage<ProfileController> {
  const ProfilePage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(controller.user.value.username ?? ''),
    );
  }

  @override
  ListView listView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 15),
      shrinkWrap: true,
      itemCount: controller.items.length,
      // itemBuilder: (context, index) {
      //   var model = controller.items[index];
      //   if (model is HiSimple) {
      //     return cell(model, _doPressed);
      //   }
      //   return Container();
      // },
      itemBuilder: (context, index) => cell(controller.items[index], context),
      separatorBuilder: (context, index) => controller.items[index].separator,
    );
  }

  Widget cell(HiModel model, BuildContext context) {
    if (model is! HiSimple) {
      return Container();
    }
    var id = CellId.fromValue(model.id ?? '');
    switch (id) {
      case CellId.nickname:
        return HiSimpleCell(
          model: model.copyWith(
            detail: controller.user.value.real.username,
          ),
        );
      case CellId.bio:
        return HiSimpleCell(
          model: model.copyWith(
            detail: controller.user.value.real.bio,
          ),
        );
      case CellId.company:
        return HiSimpleCell(
          model: model.copyWith(
            detail: controller.user.value.real.company,
          ),
        );
      case CellId.location:
        return HiSimpleCell(
          model: model.copyWith(
            detail: controller.user.value.real.location,
          ),
        );
      case CellId.blog:
        return HiSimpleCell(
          model: model.copyWith(
            detail: controller.user.value.real.blog,
          ),
        );
      default:
        return HiSimpleCell(
          model: model,
          onPressed: (model, {extra}) => _doPressed(model, extra, context),
        );
    }
  }

  // void _doPressed(HiModel model, {extra}) {
  // }

  _doPressed(HiModel model, extra, BuildContext context) {
    if (model is HiSimple && model.isButton) {
      _logout(context);
    }
  }

  void _logout(BuildContext context) {
    // yjx_todo
    // if (await Vibration.hasCustomVibrationsSupport() ?? false) {
    //   Vibration.vibrate(duration: 1000);
    // } else {
    //   Vibration.vibrate();
    //   await Future.delayed(const Duration(milliseconds: 500));
    //   Vibration.vibrate();
    // }
    // Get.bottomSheet(
    //   LogoutSheet(
    //     callback: (isCancel) async {
    //       Get.back();
    //       if (!isCancel) {
    //         controller.logout();
    //       }
    //     },
    //   ),
    //   backgroundColor: Colors.transparent,
    // );

    showAdaptiveActionSheet(
      context: context,
      title: const Text(
        '确定退出登录？',
        style: TextStyle(
          fontSize: 13,
          color: Colors.black54,
        ),
      ),
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: const Text(
            '退出',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          onPressed: (_) {
            Navigator.of(context).pop();
            controller.logout();
          },
        ),
      ],
      cancelAction: CancelAction(
        title: const Text(
          '取消',
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
