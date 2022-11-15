import 'package:flutter_hub/module/about/about_binding.dart';
import 'package:flutter_hub/module/about/about_page.dart';
import 'package:flutter_hub/module/language/language_binding.dart';
import 'package:flutter_hub/module/language/language_page.dart';
import 'package:flutter_hub/module/oauth/oauth_binding.dart';
import 'package:flutter_hub/module/oauth/oauth_page.dart';
import 'package:flutter_hub/module/trending/trending_binding.dart';
import 'package:flutter_hub/module/trending/trending_page.dart';
import 'package:flutter_hub/module/favorited/favorited_binding.dart';
import 'package:flutter_hub/module/favorited/favorited_page.dart';
import 'package:flutter_hub/module/home/home_binding.dart';
import 'package:flutter_hub/module/home/home_page.dart';
import 'package:flutter_hub/module/login/login_binding.dart';
import 'package:flutter_hub/module/login/login_page.dart';
import 'package:flutter_hub/module/news/news_binding.dart';
import 'package:flutter_hub/module/news/news_page.dart';
import 'package:flutter_hub/module/personal/personal_binding.dart';
import 'package:flutter_hub/module/personal/personal_page.dart';
import 'package:flutter_hub/module/splash/splash_binding.dart';
import 'package:flutter_hub/module/splash/splash_page.dart';
import 'package:flutter_hub/module/user/user_binding.dart';
import 'package:flutter_hub/module/user/user_page.dart';
import 'package:flutter_hub/module/profile/profile_binding.dart';
import 'package:flutter_hub/module/profile/profile_page.dart';
import 'package:hi_flutter/hi_flutter.dart';

class Routes {
  // root
  static const root = '/';
  // splash
  static const splash = '/splash';
  // home
  static const home = '/home';
  static const trending = '$home/trending';
  static const news = '$home/news';
  static const favorited = '$home/favorited';
  static const personal = '$home/personal';
  // web
  static const web = '/web';
  static const oauth = '/oauth';
  // other
  static const user = '/user/:username';
  static const login = '/login';
  static const about = '/about';
  static const language = '/language';
  static const profile = '/profile';

  static final getPages = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: trending,
      page: () => const TrendingPage(),
      binding: TrendingBinding(),
    ),
    GetPage(
      name: news,
      page: () => const NewsPage(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: favorited,
      page: () => const FavoritedPage(),
      binding: FavoritedBinding(),
    ),
    GetPage(
      name: personal,
      page: () => const PersonalPage(),
      binding: PersonalBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: web,
      page: () => HiWebPage(),
      binding: HiWebBinding(),
    ),
    GetPage(
      name: oauth,
      page: () => OauthPage(),
      binding: OauthBinding(),
    ),
    GetPage(
      name: about,
      page: () => const AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: language,
      page: () => const LanguagePage(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: user,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
  ];
}
