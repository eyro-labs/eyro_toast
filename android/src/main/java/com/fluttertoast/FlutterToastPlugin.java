package com.fluttertoast;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterToastPlugin */
public class FlutterToastPlugin implements MethodCallHandler {
  private final Context applicationContext;

  public FlutterToastPlugin(Context applicationContext) {
    this.applicationContext = applicationContext;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_toast");
    channel.setMethodCallHandler(new FlutterToastPlugin(registrar.context().getApplicationContext()));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("showToast")) {
      FlutterToastData data = FlutterToastData.fromObject(call.arguments);
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
