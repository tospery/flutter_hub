import 'package:flutter/material.dart';
import 'package:flutter_hub/index.dart';
import 'package:flutter_hub/module/about/about_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutPage extends HiListPage<AboutController> {
  const AboutPage({super.key});

  @override
  ListView listView(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: controller.items.length,
      itemBuilder: (context, index) =>
          controller.items[index].cell(onPressed: controller.doPressed),
      separatorBuilder: (context, index) => controller.items[index].separator,
    );
  }
  
}
