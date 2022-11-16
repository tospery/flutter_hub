import 'package:flutter_hub/module/scheme/scheme_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class SchemePage extends HiListPage<SchemeController> {
  const SchemePage({super.key});

  // @override
  // ListView listView(BuildContext context) {
  //   return ListView.separated(
  //     padding: EdgeInsets.zero,
  //     shrinkWrap: true,
  //     itemCount: controller.items.length,
  //     itemBuilder: (context, index) =>
  //         controller.items[index].cell(onPressed: _doPressed),
  //     separatorBuilder: (context, index) => controller.items[index].separator,
  //   );
  // }

  // void _doPressed(HiModel model, {extra}) {
  //   log(model);
  //   if (model is! HiSimple) {
  //     return;
  //   }
  //   var id = CellId.fromValue(model.id ?? '');
  //   switch (id) {
  //     case CellId.author:
  //       controller.toAuthor();
  //       break;
  //     case CellId.weibo:
  //       controller.toWeibo();
  //       break;
  //     default:
  //       break;
  //   }
  // }
}
