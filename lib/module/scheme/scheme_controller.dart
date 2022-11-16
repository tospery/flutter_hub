import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class SchemeController extends HiListController<HiModel> {
  
  @override
  void onInit() {
    super.onInit();
    title = parameters.stringForKey(HiParameter.title) ?? R.strings.urlSchemes;
  }
}