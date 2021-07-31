// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

/// Flutter package for Toast for Android, iOS and Web platform.
library eyro_toast;

import 'dart:async';

import 'src/toast_duration.dart';
import 'src/toast_stub.dart'
    if (dart.library.io) 'src/toast_io.dart'
    if (dart.library.html) 'src/toast_html.dart';

export 'src/toast_duration.dart';
export 'src/toast_gravity.dart';
export 'src/toaster.dart';

/// Class for showing Toast
class EyroToast {
  /// Showing toast for specific platform
  static Future<bool> showToast({
    required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    return await Toast.showToast(text: text, duration: duration);
  }
}
