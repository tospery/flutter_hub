import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class LogoutSheet extends StatelessWidget {
  final BoolCallback? callback;

  const LogoutSheet({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: SizedBox(
        height: 150,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildTopView(),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(),
            ),
            Expanded(
              flex: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _buildButtonView(isCancel: true),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTopView() {
    return Container(
      color: Colors.white,
      child: Flex(
        direction: Axis.vertical,
        children: [
          const Expanded(
            flex: 40,
            child: Center(
              child: Text(
                '确定退出登录？',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              decoration: BoxDecoration(
                border: hiBorder(
                  top: true,
                ),
              ),
              child: _buildButtonView(isCancel: false),
            ),
          ),
        ],
      ),
    );
  }

  _buildButtonView({bool isCancel = false}) {
    return GestureDetector(
      onTap: () => callback != null ? callback!(isCancel) : null,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            isCancel ? '取消' : '退出',
            style: TextStyle(
              color: isCancel ? Colors.blue : Colors.red,
              fontSize: 18,
              fontWeight: isCancel ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
