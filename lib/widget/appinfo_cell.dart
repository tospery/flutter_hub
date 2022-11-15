import 'package:flutter/material.dart';
import 'package:flutter_hub/model/appinfo.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AppInfoCell extends HiCell<AppInfo> {
  const AppInfoCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hiImage(
            model.icon ?? '',
            height: 90,
          ),
          hiSpace(height: 10),
          Text(
            model.name ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          hiSpace(height: 4),
          Text(
            model.version ?? '',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
