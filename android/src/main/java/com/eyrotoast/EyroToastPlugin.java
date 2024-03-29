// Copyright (c) 2019, the Eyro Toast project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
package com.eyrotoast;

import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** EyroToastPlugin */
public class EyroToastPlugin implements MethodCallHandler {
  private final Context applicationContext;

  public EyroToastPlugin(Context applicationContext) {
    this.applicationContext = applicationContext;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "eyro_toast");
    channel.setMethodCallHandler(new EyroToastPlugin(registrar.context().getApplicationContext()));
  }

  @Override
  public void onMethodCall(MethodCall call, @NonNull Result result) {
    if (call.method.equals("showToast")) {
      EyroToastData data = EyroToastData.fromObject(call.arguments);
      if (data != null) {
        Toast.makeText(applicationContext, data.getText(), data.getDuration()).show();
        result.success(true);
        return;
      }
      result.success(false);
      return;
    }

    result.notImplemented();
  }
}
