import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/flutter_toast.dart';
import 'package:flutter_toast/src/toast_duration.dart';
import 'package:flutter_toast/src/toaster.dart';

/// Class with static method for showing Toast at platform specific channel.
class Toast {

  /// Calling showToast using pure Flutter method at Web platform
  static Future<bool> showToast({
    @required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    return await showToaster(text: text, duration: duration);
  }
}
