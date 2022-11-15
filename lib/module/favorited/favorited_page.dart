import 'package:flutter/material.dart';
import 'package:flutter_hub/module/favorited/favorited_controller.dart';
import 'package:hi_flutter/hi_flutter.dart';

class FavoritedPage extends HiBasePage<FavoritedController> {
  const FavoritedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorited'),
      ),
    );
  }
}
