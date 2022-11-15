import 'package:flutter/material.dart';
import 'package:flutter_hub/module/language/language_controller.dart';
import 'package:flutter_hub/widget/language_cell.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LanguagePage extends HiBasePage<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget body(BuildContext context) {
    return HiRefreshView<LanguageController>(
      listView: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return LanguageCell(model: controller.items[index]);
        },
      ),
    );
  }
}
