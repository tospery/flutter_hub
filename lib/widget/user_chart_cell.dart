import 'package:flutter/material.dart';
import 'package:flutter_hub/index.dart';
import 'package:hi_flutter/hi_flutter.dart';

class UserChartCell extends HiCell<User> {
  const UserChartCell({super.key, required super.model, super.onPressed});

  @override
  Widget build(BuildContext context) {
    if (!model.isValid) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      height: 120,
      child: SvgPicture.network(
        model.charUrlString,
                fit: BoxFit.fitHeight,
        alignment: Alignment.centerRight,
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
