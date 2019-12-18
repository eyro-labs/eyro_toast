import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toast/src/toast_duration.dart';

/// Class with static method for showing Toast at platform specific channel.
class Toast {
  static const MethodChannel _channel = const MethodChannel('flutter_toast');

  /// Calling native showToast method at Android and iOS
  static Future<bool> showToast({
    @required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    return await _channel.invokeMethod('showToast', {
      'text': text,
      'duration': duration.value,
    });
  }
}
