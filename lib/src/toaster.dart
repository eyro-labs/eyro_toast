import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/src/toast_duration.dart';
import 'package:flutter_toast/src/toast_gravity.dart';
import 'package:flutter_toast/src/toast_view.dart';

Future<bool> showToaster({
  @required String text,
  ToastDuration duration = ToastDuration.short,
  ToastGravity gravity = ToastGravity.bottom,
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
  Color backgroundColor = const Color(0xAA000000),
  Color fontColor = const Color(0xFFFFFFFF),
  TextAlign textAlign = TextAlign.center,
  EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 16),
  EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  ),
  Border border,
}) async {
  ToastView.shared.dismiss();
  await ToastView.shared
      .create(
        text,
        gravity,
        border,
        borderRadius,
        backgroundColor,
        fontColor,
        textAlign,
        margin,
        padding,
      )
      .show(duration);
  return true;
}

class FlutterToastSetup {
  static final FlutterToastSetup shared = FlutterToastSetup._internal();

  FlutterToastSetup._internal();

  GlobalKey<NavigatorState> navigatorKey;
}
