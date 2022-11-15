import 'package:flutter/material.dart';
import 'package:flutter_hub/extension/hi_user_ex.dart';
import 'package:flutter_hub/module/personal/personal_controller.dart';
import 'package:flutter_hub/resource/strings.dart';
import 'package:hi_flutter/hi_flutter.dart';

class ProfileHeader extends GetView<PersonalController> {
  final VoidCallback? onPressed;

  const ProfileHeader({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildTopView(context),
        _buildCenterView(context),
        _buildActions(context),
      ],
    );
  }

  _buildUser(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _buildUserAvatar(context),
                hiSpace(width: 12),
                _buildUserInfo(context),
              ],
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  _buildUserAvatar(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FractionallySizedBox(
        heightFactor: 0.7,
        child: hiImage(
          R.assets.images.userDefault,
        ),
      ),
    );
  }

  _buildUserInfo(BuildContext context) {
    if (!controller.user.value.isValid) {
      return const Text(
        '点击登录',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.user.value.username ?? '',
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        hiSpace(height: 3),
        Text(
          controller.user.value.real.bio ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        hiSpace(height: 3),
        Text(
          _joinedString(controller.user.value.real.createdAt ?? ''),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  _buildStat(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: hiBorder(
          color: Colors.grey[200],
          top: true,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: null,
            child: _buildStatItem(
              context,
              R.strings.repositories.tr.capitalizeFirst,
              controller.user.value.real.publicRepos ?? 0,
            ),
          ),
          GestureDetector(
            onTap: null,
            child: _buildStatItem(
              context,
              R.strings.followers.tr.capitalizeFirst,
              controller.user.value.real.followers ?? 0,
            ),
          ),
          GestureDetector(
            onTap: null,
            child: _buildStatItem(
              context,
              R.strings.following.tr.capitalizeFirst,
              controller.user.value.real.following ?? 0,
            ),
          ),
        ],
      ),
    );
  }

  _buildStatItem(BuildContext context, String? text, int count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        hiSpace(height: 2),
        Text(
          text ?? '',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black45,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  _buildTopView(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.elliptical(40, 15),
          ),
          color: context.theme.primaryColor,
        ),
      ),
    );
  }

  _buildCenterView(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        width: context.width * 0.9,
        height: context.width * 0.9 * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 60,
              child: _buildUser(context),
            ),
            Expanded(
              flex: 40,
              child: _buildStat(context),
            ),
          ],
        ),
        // color: Colors.green,
      ),
    );
  }

  _buildActions(BuildContext context) {
    return const Positioned(
      top: 60,
      right: 15,
      child: Icon(
        Icons.light_mode,
        color: Colors.white,
      ),
    );
  }

  String _joinedString(String str) {
    if (str.length < 10) {
      return R.strings.joinedOn + str;
    }
    return R.strings.joinedOn + str.substring(0, 10);
  }
}
