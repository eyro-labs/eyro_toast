// Copyright (c) 2019, the Flutter Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

/// Flutter package for Toast for Android, iOS and Web platform.
library flutter_toast;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_toast/src/toast_duration.dart';
import 'package:flutter_toast/src/toast_unsupported.dart'
    if (dart.library.io) 'package:flutter_toast/src/toast_mobile.dart'
    if (dart.library.html) 'package:flutter_toast/src/toast_web.dart';

export 'src/toast_duration.dart';
export 'src/toast_gravity.dart';
export 'src/toaster.dart';

/// Class for showing Toast
class FlutterToast {

  /// Showing toast for specific platform
  static Future<bool> showToast({
    @required String text,
    ToastDuration duration = ToastDuration.short,
  }) async {
    return await Toast.showToast(text: text, duration: duration);
  }
}
