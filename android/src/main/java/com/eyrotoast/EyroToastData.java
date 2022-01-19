// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
package com.eyrotoast;

import android.widget.Toast;

import java.util.Map;

/**
 * User: maulana
 * Date: 2019-11-05
 * Time: 21:07
 */
class EyroToastData {
  private final String text;
  private final int duration;

  EyroToastData(String text, int duration) {
    this.text = text;
    this.duration = duration;
  }

  static EyroToastData fromObject(Object arg) {
    if (arg instanceof Map) {
      //noinspection rawtypes
      Map map = (Map) arg;
      String text = "";
      if (map.get("text") instanceof String) {
        text = (String) map.get("text");
      }

      int duration = 0;
      if (map.get("duration") instanceof Integer) {
        //noinspection ConstantConditions
        duration = (int) map.get("duration");
      }
      return new EyroToastData(
          text,
          duration
      );
    }

    return null;
  }

  String getText() {
    return text;
  }

  int getDuration() {
    if (duration == 0) {
      return Toast.LENGTH_SHORT;
    }
    return Toast.LENGTH_LONG;
  }
}
