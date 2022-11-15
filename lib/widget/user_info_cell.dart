import 'package:flutter/material.dart';
import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class UserInfoCell extends HiCell<User> {
  const UserInfoCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 100,
          child: Row(
            children: [
              hiSpace(width: 15),
              _buildAvatar(context),
              hiSpace(width: 10),
              _buildInfo(context),
              hiSpace(width: 15),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: context.width / 3.0,
                height: double.infinity,
                child: model.numText(
                  R.strings.repositories.tr,
                  model.publicRepos ?? 0,
                ),
              ),
              SizedBox(
                width: context.width / 3.0,
                height: double.infinity,
                child: model.numText(
                  R.strings.followers.tr,
                  model.followers ?? 0,
                ),
              ),
              SizedBox(
                width: context.width / 3.0,
                height: double.infinity,
                child: model.numText(
                  R.strings.following.tr,
                  model.following ?? 0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildAvatar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: FractionallySizedBox(
        heightFactor: 0.7,
        child: AspectRatio(
          aspectRatio: 1,
          child: hiImage(model.avatarUrl ?? ''),
        ),
      ),
    );
  }

  _buildInfo(BuildContext context) {
    var width = context.width - 15 - 100 * 0.7 - 10 - 15;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: model.name,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: '(${model.username})',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: Text(
            model.bio ?? '',
            maxLines: 2,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          model.joinedText,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
