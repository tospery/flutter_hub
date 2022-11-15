import 'package:flutter_hub/model/language.dart';
import 'package:hi_flutter/hi_flutter.dart';

class TrendingService extends HiService {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://gtrend.yapie.me';
  }

  //   Future<DataList<Project>> hotProducts({
  //   int pageIndex = 0,
  //   int pageSize = 10,
  // }) {
  //   return get('/article/listproject/$pageIndex/json?page_size=$pageSize')
  //       .then(convertTo<DataList<Project>>);
  // }

  @override
  Future<T> convertTo<T>(Response<dynamic> response) {
    if (response.hasError) {
      return Future.error(
        HiServerError(
          response.statusCode ?? -1,
          response.statusText,
          data: response.body,
        ),
      );
    }
    var base = response.body;
    if (base is Exception) {
      throw base;
    }
    if (base is! HiResponse) {
      throw HiError.unknown;
    }
    var data = base.data;
    if (data is! Map<String, dynamic>) {
      throw HiError.unknown;
    }
    T? result;
    // if (T == DataList<Project>) {
    //   var dataList = DataList<Project>.fromJson(data);
    //   result = dataList.isValid ? dataList as T? : null;
    // } else if (T == User) {
    //   var user = User.fromJson(data);
    //   result = user.isValid ? user as T? : null;
    // }
    if (result == null) {
      throw HiError.unknown;
    }
    return Future.value(result);
  }

  Future<List<Language>> languages() {
    // return get('/languages')/*.then(getData)*/.then((data) {
    //   if (data is! List) {
    //     return <Language>[];
    //   }
    //   return data
    //       .map((e) => Language.fromJson(e as Map<String, dynamic>? ?? {}))
    //       .toList();
    // });
    return Future.error(HiError.unknown);
  }
}
