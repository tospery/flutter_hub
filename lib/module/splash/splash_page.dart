import 'package:flutter/material.dart';
import 'package:flutter_hub/core/routes.dart';
import 'package:flutter_hub/module/splash/splash_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class SplashPage extends HiBasePage<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    removeSystemTransparent(context);
    // precacheImage(AssetImage(R.assets.images.personalParallaxBg), context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: controller.opacity,
        duration: const Duration(milliseconds: 2000),
        onEnd: () {
          Get.offNamed(Routes.home);
          // if (Get.find<HiUser>().isLogined) {
          //   Get.offNamed(Routes.home);
          // } else {
          //   Get.offNamed(Routes.login);
          // }
        },
        child: Container(),
      ),
    );
  }
}
