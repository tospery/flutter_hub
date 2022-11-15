import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_hub/index.dart';
import 'package:flutter_hub/module/personal/personal_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class PersonalPage extends HiBasePage<PersonalController> {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      title: Text(
        R.strings.profile.tr.capitalizeFirst!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.light_mode,
            color: Colors.white,
          ),
        ),
      ],
      headerWidget: ProfileHeader(
        onPressed: controller.headerPressed,
      ),
      body: [
        listView(),
      ],
      curvedBodyRadius: 0,
      backgroundColor: Colors.grey.shade100,
      appBarColor: context.theme.primaryColor,
      // stretchTriggerOffset: 100,
      // fullyStretchable: true,
      headerExpandedHeight: 235.0 / 390.0 * context.width / context.height,
    );
  }

  ListView listView() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controller.items.length,
      itemBuilder: (context, index) =>
          controller.items[index].cell(onPressed: _doPressed),
      // itemBuilder: (context, index) => cell(controller.items[index]),
      separatorBuilder: (context, index) => controller.items[index].separator,
    );
  }

  void _doPressed(HiModel model, {extra}) {
    log(model);
    if (model is HiSimple) {
      var id = CellId.fromValue(model.id ?? '');
      switch (id) {
        case CellId.about:
          Get.toNamed(Routes.about);
          break;
        default:
          break;
      }
    }
  }

  // Widget cell(HiModel model) {
  //   if (model is HiSimple) {
  //     return HiSimpleCell(
  //       model: model,
  //       onPressed: _doPressed,
  //     );
  //   }
  //   if (model is User) {
  //     var cellType = model.cellType;
  //     switch (cellType) {
  //       case UserCellType.chart:
  //         return UserChartCell(
  //           model: controller.user.value.real,
  //           onPressed: _doPressed,
  //         );
  //     }
  //   }
  //   return Container();
  // }
}
