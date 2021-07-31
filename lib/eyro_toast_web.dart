import 'package:eyro_toast/eyro_toast.dart';
import 'package:eyro_toast/src/toast_html.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class EyroToastWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'eyro_toast',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = EyroToastWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  /// Handles method calls over the MethodChannel of this plugin.
  /// Note: Check the "federated" architecture for a new way of doing this:
  /// https://flutter.dev/go/federated-plugins
  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'showToast':
        final map = call.arguments;
        if (map is Map) {
          final text = map['text'] as String?;
          final d = map['duration'] as int?;

          if (text != null) {
            final duration = d == 1 ? ToastDuration.long : ToastDuration.short;
            Toast.showToast(text: text, duration: duration);
          }
        }
        break;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'eyro_toast for web doesn\'t implement \'${call.method}\'',
        );
    }
  }
}
