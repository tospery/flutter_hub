import 'package:flutter_hub/model/language.dart';
import 'package:flutter_hub/model/user.dart';
import 'package:flutter_hub/provider/github_api_service.dart';
import 'package:flutter_hub/provider/github_main_service.dart';
import 'package:hi_flutter/hi_flutter.dart';
import 'package:flutter_hub/provider/trending_service.dart';

class Provider extends HiProvider {
  final TrendingService trendingService;
  final GithubMainService githubMainService;
  final GithubApiService githubApiService;

  Provider({
    required this.trendingService,
    required this.githubMainService,
    required this.githubApiService,
  });
}

extension HiProviderEx on HiProvider {
  Future<List<Language>> languages() =>
      (this as Provider).trendingService.languages();
  Future<String> token(String code) =>
      (this as Provider).githubMainService.token(code);
  Future<User> login(String token) =>
      (this as Provider).githubApiService.login(token);
  Future<User> user(String username) =>
      (this as Provider).githubApiService.user(username);
}
