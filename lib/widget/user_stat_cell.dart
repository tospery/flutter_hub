import 'package:flutter/material.dart';
import 'package:flutter_hub/model/user.dart';
import 'package:hi_flutter/hi_flutter.dart';

class UserStatCell extends HiCell<User> {
  const UserStatCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    if (!model.isValid) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 120,
      child: SvgPicture.network(
        model.charUrlString,
        allowDrawingOutsideViewBox: true,
        placeholderBuilder: (BuildContext context) => SizedBox(
          width: context.width,
          height: 120,
          child: Center(
            child: SpinKitRipple(
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
