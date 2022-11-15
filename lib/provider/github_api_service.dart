import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class GithubApiService extends HiService {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://api.github.com';
    // httpClient.addRequestModifier((Request request) {
    //   var config = Get.find<HiConfiguration>();
    //   var token = config.real.token;
    //   if (token?.isNotEmpty ?? false) {
    //     log('设置token: ${request.url}');
    //     request.headers['Authorization'] = 'token $token';
    //   }
    //   return request;
    // });
  }

  Future<User> login(String token) {
    return get(
      '/user',
      headers: {'Authorization': 'token $token'},
    )
        .then((value) => result(value, checkCode: false, returnData: false))
        .then((value) {
      if (value is! Map<String, dynamic>) {
        return Future.error(HiError.dataInvalid);
      }
      var user = User.fromJson(value);
      if (!user.isValid) {
        return Future.error(HiError.dataInvalid);
      }
      return user;
    });
  }

  Future<User> user(String username) {
    return get(
      '/users/$username',
      // headers: {
      //   'Authorization': 'token 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'
      // },
    )
        .then((value) => result(value, checkCode: false, returnData: false))
        .then((value) {
      if (value is! Map<String, dynamic>) {
        return Future.error(HiError.dataInvalid);
      }
      var user = User.fromJson(value);
      if (!user.isValid) {
        return Future.error(HiError.dataInvalid);
      }
      return user;
    });
  }
}
