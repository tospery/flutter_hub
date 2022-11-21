import 'package:flutter/services.dart';
import 'package:flutter_hub/core/datatype.dart';
import 'package:flutter_hub/core/routes.dart';
import 'package:flutter_hub/model/appinfo.dart';
import 'package:flutter_hub/resource/assets_data.dart';
import 'package:flutter_hub/resource/strings.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends HiListController<HiModel> {
  @override
  void onInit() {
    super.onInit();
    // title = parameters.stringForKey(HiParameter.title);
    title = parameters.stringForKey(HiParameter.title) ?? R.strings.about.tr;
  }

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

  void doPressed(HiModel model, {extra}) async {
    if (model is! HiSimple) {
      return;
    }
    var id = CellId.fromValue(model.id ?? '');
    switch (id) {
      case CellId.author:
        Get.toNamed(Routes.user.take('tospery'));
        break;
      case CellId.weibo:
        if (!await launchUrl(
            Uri.tryParse('sinaweibo://userinfo?uid=7718833735')!)) {
          launchUrl(Uri.tryParse('https://m.weibo.cn/u/7718833735')!,
              mode: LaunchMode.inAppWebView);
        }
        break;
      case CellId.scheme:
        Get.toNamed(Routes.scheme);
        break;
      case CellId.score:
        launchUrl(
          Uri.tryParse(
              'itms-apps://itunes.apple.com/app/id414478124?action=write-review')!,
        );
        break;
      default:
        break;
    }
  }
}
