package com.fluttertoast;

import android.widget.Toast;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

/**
 * User: maulana
 * Date: 2019-11-05
 * Time: 21:07
 */
class FlutterToastData {
  private String text;
  private int duration;

  FlutterToastData(String text, int duration) {
    this.text = text;
    this.duration = duration;
  }

  static FlutterToastData fromObject(Object arg) {
    if (arg instanceof Map) {
      Map map = (Map) arg;
      String text = "";
      if (map.get("text") instanceof String) {
        text = (String) map.get("text");
      }

      int duration = 0;
      if (map.get("duration") instanceof Integer) {
        duration = (int) map.get("duration");
      }
      return new FlutterToastData(
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
