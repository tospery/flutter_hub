import 'package:flutter/material.dart';
import 'package:flutter_hub/model/language.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LanguageCell extends HiCell<Language> {
  const LanguageCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: hiBorder(context: context, bottom: true),
      ),
      child: Text(
        model.name ?? '',
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
