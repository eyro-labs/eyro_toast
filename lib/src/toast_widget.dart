import 'package:flutter/widgets.dart';

import 'toast_gravity.dart';

/// Widget class for setting up the position of Toast
class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  /// The widget of Toast to show
  final Widget widget;

  /// The gravity of Toast to show
  final ToastGravity gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: gravity == ToastGravity.top ? 50 : null,
      bottom: gravity == ToastGravity.bottom ? 50 : null,
      child: Container(
        color: const Color(0x00000000),
        child: widget,
      ),
    );
  }
}
