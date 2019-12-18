import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eyro_toast/eyro_toast.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel = MethodChannel('eyro_toast');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      final method = methodCall.method;
      final args = methodCall.arguments;
      if (method == 'showToast') {
        if (args != null) {
          final text = args['text'];
          // validate only when text is not null
          return text != null;
        }

        return false;
      }

      throw MissingPluginException(
          'No implementation found for method $method on channel ${channel.name}');
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('showToast with text arguments return "true"', () async {
    expect(
      await EyroToast.showToast(
        text: 'Show toast',
      ),
      true,
    );
  });

  test('showToast with text and duration arguments return "true"', () async {
    expect(
      await EyroToast.showToast(
        text: 'Show toast',
        duration: ToastDuration.long,
      ),
      true,
    );
  });

  test('showToast without text arguments return "false"', () async {
    expect(
      await EyroToast.showToast(text: null),
      false,
    );
  });
}
