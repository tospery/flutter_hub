import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:clipboard/clipboard.dart';

class SchemeController extends HiListController<HiModel> {
  @override
  void onInit() {
    super.onInit();
    title =
        parameters.stringForKey(HiParameter.title) ?? R.strings.urlSchemes.tr;
  }

  @override
  void requestData({required HiRequestMode mode}) async {
    var string = await rootBundle.loadString(R.assets.data.schemeSimples);
    var json = string.toJsonArray() ?? [];
    var simples = json
        .map((e) => HiSimple.fromJson(e as Map<String, dynamic>? ?? {}))
        .toList();
    items.addAll(simples);
    finish(items: items);
  }

  doPressed(HiModel model, extra, BuildContext context) {
    // var result1 = Get.context?.toString();
    // log('result1 = $result1');
    // var ctx = Get.context;
    // if (ctx == null) {
    //   return;
    // }
    // GFToast.showToast(
    //   R.strings.haveCopyScheme.tr,
    //   ctx,
    //   backgroundColor: Colors.green,
    // );
    var scheme = (model as HiSimple?)?.subTitle;
    if (scheme?.isEmpty ?? true) {
      return;
    }
    FlutterClipboard.copy(scheme!).then((value) {
      GFToast.showToast(
        R.strings.haveCopyScheme.tr,
        context,
        backgroundColor: Colors.green,
      );
    });
    // Get.snackbar(
    //   '',
    //   '',
    //   titleText: Container(),
    //   messageText: Text(
    //     R.strings.haveCopyScheme.tr,
    //     style: const TextStyle(
    //       fontSize: 15,
    //       color: Colors.white,
    //     ),
    //   ),
    //   icon: const Icon(
    //     Icons.check_circle,
    //     color: Colors.white,
    //   ),
    //   backgroundColor: Colors.green,
    //   margin: EdgeInsets.zero,
    //   padding: const EdgeInsets.only(
    //     left: 0,
    //     right: 0,
    //     top: 8,
    //     bottom: 12,
    //   ),
    //   maxWidth: 180,
    // );
  }
}
