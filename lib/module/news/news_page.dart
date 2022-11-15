import 'package:flutter/material.dart';
import 'package:flutter_hub/module/news/news_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class NewsPage extends HiBasePage<NewsController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('News'),
      ),
    );
  }
}
