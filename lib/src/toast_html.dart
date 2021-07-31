import 'dart:async';

import 'toast_duration.dart';
import 'toaster.dart';

/// Class with static method for showing Toast at platform specific channel.
class Toast {
  /// Calling showToast using pure Flutter method at Web platform
  static Future<bool> showToast({
    required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    return await showToaster(text: text, duration: duration);
  }
}
