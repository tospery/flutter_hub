import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'en_US.dart';
import 'zh_CN.dart';

class AppTranslations extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}
