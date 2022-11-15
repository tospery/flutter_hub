import 'package:flutter_hub/core/datatype.dart';
import 'package:flutter_hub/extension/hi_parameter_ex.dart';
import 'package:hi_flutter/hi_flutter.dart';

class GithubMainService extends HiService {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://github.com';
  }

  Future<String> token(String code) {
    return post(
      '/login/oauth/access_token',
      {
        HiParameter.code: code,
        HiParameterEx.clientId: HiConstantEx.githubAppId,
        HiParameterEx.clientSecret: HiConstantEx.githubAppSecret,
      },
      headers: {'Accept': 'application/json'},
    ).then((value) => result(value, checkCode: false)).then((value) {
      var token = hiString(value);
      if (token?.isEmpty ?? true) {
        return Future.error(HiError.dataInvalid);
      }
      return token!;
    });

    // .then((value) {
    //   var data = result(value, checkCode: false);
    //   var token = hiString(data);
    //   if (token?.isEmpty ?? true) {
    //     return Future.error(HiError.dataInvalid);
    //   }
    //   return token!;
    // });
    // .then((value) => result(value, checkCode: false)).then((value) {});
    // decoder: (json) {
    //   if (json is! Map<String, dynamic>) {
    //     return HiError.unknown;
    //   }
    //   var base = HiResponse.fromJson(json);
    //   if (hiString(base.data)?.isEmpty ?? true) {
    //     return HiError.unknown;
    //   }
    //   return base;
    // },
    // ).then(getData).then((data) {
    //   return hiString(data)!;
    // });
  }
}
