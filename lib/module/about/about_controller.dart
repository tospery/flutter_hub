import 'package:flutter/services.dart';
import 'package:flutter_hub/core/routes.dart';
import 'package:flutter_hub/model/appinfo.dart';
import 'package:flutter_hub/resource/assets_data.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutController extends HiListController<HiModel> {
  @override
  void requestData({required HiRequestMode mode}) async {
    var string = await rootBundle.loadString(R.assets.data.aboutSimples);
    var json = string.toJsonArray() ?? [];
    var simples = json
        .map((e) => HiSimple.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    items.add(AppInfo.myDefault());
    items.addAll(simples);
    finish(items: items);
  }

  void toAuthor() {
    Get.toNamed(Routes.user.take('tospery'));
  }
  
}
