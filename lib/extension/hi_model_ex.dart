import 'package:flutter/material.dart';
import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

extension HiModelEx on HiModel {
  Widget cell({HiCellPressed? onPressed}) {
    if (this is HiSimple) {
      return HiSimpleCell(
        model: this as HiSimple,
        onPressed: onPressed,
      );
    } else if (this is AppInfo) {
      return AppInfoCell(
        model: this as AppInfo,
        onPressed: onPressed,
      );
    } else if (this is User) {
      var cellType = (this as User).cellType;
      switch (cellType) {
        case UserCellType.chart:
          return UserChartCell(
            model: this as User,
            onPressed: onPressed,
          );
      }
    }
    // else {
    //   var cellId = CellId.fromValue(id ?? '');
    //   switch (cellId) {
    //     case CellId.userInfo:
    //       return UserInfoCell(
    //         model: this,
    //         onPressed: onPressed,
    //       );
    //     default:
    //       break;
    //   }
    // }
    return Container();
  }
}
