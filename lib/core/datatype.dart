import 'package:hi_flutter/hi_flutter.dart';

extension HiConstantEx on HiConstant {
  static get githubAppId => 'dfb24ab8629d8f2a8a93';
  static get githubAppSecret => '4ac0b4d8bfd346e82620eb38c0df7418269bc6b8';
  static get githubRedirectUri => 'gsygithubapp://authed';
  static get githubOauthUrlString =>
      'https://github.com/login/oauth/authorize?client_id'
      '=$githubAppId&state=app&'
      "scope=user,repo,gist,notifications,read:org,workflow&"
      "redirect_uri=$githubRedirectUri";
}

enum CellId {
  unknown,
  // simple
  space,
  button,
  setting,
  about,
  feedback,
  author,
  weibo,
  scheme,
  rating,
  share,
  nickname,
  bio,
  company,
  location,
  email,
  blog,
  // other
  userInfo,
  userStat,
  userItem,
  unlogined;

  String get title => instanceName.tr;

  // String? get routerPath {
  //   switch (this) {
  //     case PortalType.dark:
  //     case PortalType.appinfo:
  //     case PortalType.space:
  //       return null;
  //     case PortalType.unlogined:
  //       return HiHost.login;
  //     default:
  //       return instanceName;
  //   }
  // }

  factory CellId.fromValue(String value) =>
      {
        CellId.unknown.instanceName: CellId.unknown,
        CellId.space.instanceName: CellId.space,
        CellId.button.instanceName: CellId.button,
        CellId.setting.instanceName: CellId.setting,
        CellId.about.instanceName: CellId.about,
        CellId.feedback.instanceName: CellId.feedback,
        CellId.author.instanceName: CellId.author,
        CellId.weibo.instanceName: CellId.weibo,
        CellId.scheme.instanceName: CellId.scheme,
        CellId.rating.instanceName: CellId.rating,
        CellId.share.instanceName: CellId.share,
        CellId.nickname.instanceName: CellId.nickname,
        CellId.bio.instanceName: CellId.bio,
        CellId.company.instanceName: CellId.company,
        CellId.location.instanceName: CellId.location,
        CellId.email.instanceName: CellId.email,
        CellId.blog.instanceName: CellId.blog,
        CellId.userInfo.instanceName: CellId.userInfo,
        CellId.userStat.instanceName: CellId.userStat,
        CellId.userItem.instanceName: CellId.userItem,
        CellId.unlogined.instanceName: CellId.unlogined,
      }[value] ??
      CellId.unknown;
}
