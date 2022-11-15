import 'package:hi_flutter/hi_flutter.dart';

class SplashController extends HiBaseController {
  var opacity = 0.0;

  @override
  void onInit() {
    super.onInit();
    lazyInitAnim();
  }

  void lazyInitAnim() {
    Future.delayed(const Duration(milliseconds: 200), () {
      opacity = 1.0;
      update();
    });
  }
}
