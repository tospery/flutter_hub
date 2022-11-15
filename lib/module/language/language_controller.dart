import 'package:flutter_hub/provider/provider.dart';
import 'package:hi_flutter/hi_flutter.dart';

// 底部安全区域高度的cell
// 2. 本地缓存
class LanguageController extends HiListController {
  @override
  void requestData({required HiRequestMode mode}) async {
    try {
      var result = await provider.languages();
      if (mode != HiRequestMode.more) {
        items.clear();
      }
      items.addAll(result);
      finish(items: items);
    } catch (e) {
      finish(error: e as HiError? ?? HiError.unknown);
    }
  }
}
