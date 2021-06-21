import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'toast_duration.dart';
import 'toaster.dart';

/// Class with static method for showing Toast at platform specific channel.
class Toast {
  static const MethodChannel _channel = const MethodChannel('eyro_toast');

  /// Calling native showToast method at Android and iOS
  static Future<bool> showToast({
    @required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    try {
      return await _channel.invokeMethod('showToast', {
        'text': text,
        'duration': duration.value,
      });
    } on MissingPluginException catch (_) {
      return await showToaster(text: text, duration: duration);
    }
  }
}
