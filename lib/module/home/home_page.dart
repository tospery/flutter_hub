import 'package:flutter/material.dart';
import 'package:flutter_hub/module/trending/trending_page.dart';
import 'package:flutter_hub/module/favorited/favorited_page.dart';
import 'package:flutter_hub/module/news/news_page.dart';
import 'package:flutter_hub/module/personal/personal_page.dart';
import 'package:flutter_hub/resource/strings.dart';
import 'package:hi_flutter/hi_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final List<Widget> pages = [
    const TrendingPage(),
    const NewsPage(),
    const FavoritedPage(),
    const PersonalPage(),
  ];
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    tabController = TabController(length: pages.length, vsync: this);
    tabController.addListener(() {
      // var index = tabController.index;
      // log('tabbar index = $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: TabBarView(
        controller: tabController,
        children: pages,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: true,
          child: Container(
            height: 65,
            color: Colors.white,
            // decoration: hiShadowDecoration(radius: 0),
            child: TabBar(
              indicator: const BoxDecoration(),
              labelColor: context.theme.primaryColor, //Colors.red,
              unselectedLabelColor: Colors.black,
              controller: tabController,
              tabs: [
                HiTabBarItem(
                  title: R.strings.dashboard.tr,
                  iconData: Icons.turned_in,
                ),
                HiTabBarItem(
                  title: R.strings.news.tr,
                  iconData: Icons.send,
                ),
                HiTabBarItem(
                  title: R.strings.favorited.tr,
                  iconData: Icons.favorite,
                ),
                HiTabBarItem(
                  title: R.strings.profile.tr,
                  iconData: Icons.person,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    tabController.dispose();
    super.dispose();
  }
}
