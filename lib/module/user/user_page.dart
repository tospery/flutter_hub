import 'package:flutter/material.dart';
import 'package:flutter_hub/module/user/user_controller.dart';
import 'package:flutter_hub/widget/user_stat_cell.dart';
import 'package:hi_flutter/hi_flutter.dart';

import '../../core/datatype.dart';
import '../../widget/user_info_cell.dart';

class UserPage extends HiListPage<UserController> {
  const UserPage({super.key});

  @override
  ListView listView(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controller.items.length,
      itemBuilder: (context, index) =>
          _cell(controller.items[index], _doPressed),
      separatorBuilder: (context, index) => controller.items[index].separator,
    );
  }

  void _doPressed(HiModel model, {extra}) {}

  _cell(HiModel item, void Function(HiModel model, {dynamic extra}) doPressed) {
    if (item is HiSimple) {
      return HiSimpleCell(model: item);
    }
    var id = CellId.fromValue(item.id ?? '');
    switch (id) {
      case CellId.userInfo:
        return UserInfoCell(
          model: controller.current.value,
          onPressed: doPressed,
        );
      case CellId.userStat:
        return UserStatCell(model: controller.current.value);
      default:
        return Container();
    }
  }
}
