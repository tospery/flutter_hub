import 'package:flutter_hub/core/datatype.dart';
import 'package:flutter_hub/module/oauth/oauth_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class OauthPage extends HiWebPage<OauthController> {
  OauthPage({super.key});

  @override
  NavigationDecision navigationDecision(NavigationRequest navigation) {
    if (navigation.url.startsWith(HiConstantEx.githubRedirectUri)) {
      var code = Uri.tryParse(navigation.url)
          ?.queryParameters
          .stringForKey(HiParameter.code);
      log('授权拿到的code = $code');
      Get.back<String>(result: code);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }
}
