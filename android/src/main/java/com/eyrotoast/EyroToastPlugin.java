package com.eyrotoast;

import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;

import java.lang.ref.WeakReference;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;

/** EyroToastPlugin */
public class EyroToastPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private WeakReference<Context> refApplicationContext;
  private FlutterPluginBinding flutterPluginBinding;

  public static void registerWith(PluginRegistry.Registrar registrar) {
    final EyroToastPlugin instance = new EyroToastPlugin();
    instance.setupChannels(registrar.messenger(), registrar.context());
  }

  private void setupChannels(BinaryMessenger messenger, Context applicationContext) {
    channel = new MethodChannel(messenger, "eyro_toast");
    channel.setMethodCallHandler(this);

    refApplicationContext = new WeakReference<>(applicationContext);
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    this.flutterPluginBinding = flutterPluginBinding;
    
    setupChannels(flutterPluginBinding.getBinaryMessenger(), flutterPluginBinding.getApplicationContext());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("showToast")) {
      EyroToastData data = EyroToastData.fromObject(call.arguments);
      Context applicationContext = refApplicationContext.get();
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

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    this.flutterPluginBinding = null;
    
    channel.setMethodCallHandler(null);
  }
}
