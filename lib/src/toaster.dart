import 'dart:async';

import 'package:flutter/widgets.dart';

import 'toast_duration.dart';
import 'toast_gravity.dart';
import 'toast_view.dart';

Future<bool> showToaster({
  required String text,
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
  Border? border,
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

class EyroToastSetup {
  static final EyroToastSetup shared = EyroToastSetup._internal();

  EyroToastSetup._internal();

  GlobalKey<NavigatorState>? navigatorKey;
}
