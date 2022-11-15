import 'package:flutter/material.dart';
import 'package:flutter_hub/module/trending/trending_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class TrendingPage extends HiBasePage<TrendingController> {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
