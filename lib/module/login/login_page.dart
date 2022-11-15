import 'package:flutter/material.dart';
import 'package:flutter_hub/core/datatype.dart';
import 'package:flutter_hub/core/routes.dart';
import 'package:flutter_hub/model/configuration.dart';
import 'package:flutter_hub/module/login/login_controller.dart';
import 'package:flutter_hub/provider/provider.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LoginPage extends HiBasePage<LoginController> {
  const LoginPage({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: Center(
  //       child: Text('Login'),
  //     ),
  //   );
  // }

  @override
  Widget body(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hiImage(R.assets.images.appIcon, width: context.width * 0.3),
              hiSpace(height: 10),
              Text(
                'Flutter For GitHub',
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 25,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: InkWell(
                  onTap: login,
                  child: Container(
                    color: Colors.grey.shade800,
                    alignment: Alignment.center,
                    height: 45,
                    child: Text(
                      '使用GitHub登录',
                      style: context.theme.primaryTextTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  login() async {
    var result = await Get.toNamed(
      Routes.oauth,
      arguments: {
        HiParameter.title: 'GitHub登录',
        HiParameter.url: HiConstantEx.githubOauthUrlString,
      },
    );
    var code = result as String? ?? '';
    if (code.isEmpty) {
      return;
    }
    var token = await controller.provider.token(code);
    log('token = $token');
    var user = await controller.provider.login(token);
    var config = controller.configuration;
    var newconfig = (config as Configuration).copyWith(token: token);
    newconfig.save();
    user.save();
    log('user = $user');
  }
}
