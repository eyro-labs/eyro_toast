import 'dart:async';

import 'toast_duration.dart';

/// Class with static method for showing Toast at platform specific channel.
class Toast {
  /// Method stub for unsupported native platform calling showToast
  static Future<bool> showToast({
    required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    throw Exception('Unsupported platform');
  }
}
