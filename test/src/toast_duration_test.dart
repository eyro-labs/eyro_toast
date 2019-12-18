import 'package:flutter_test/flutter_test.dart';
import 'package:eyro_toast/eyro_toast.dart';

void main() {
  test('Short duration equalTo "2000 ms"', () async {
    final duration = ToastDuration.short;
    expect(duration.duration, 2000);
    expect(duration.value, 0);
  });

  test('Long duration equalTo "3500 ms"', () async {
    final duration = ToastDuration.long;
    expect(duration.duration, 3500);
    expect(duration.value, 1);
  });

  test('Custom duration equalTo "5432 ms"', () async {
    final duration = ToastDuration(5432);
    expect(duration.duration, 5432);
    expect(duration.value, null);
  });

  test('Predefined toast duration equalTo "2"', () async {
    final values = ToastDuration.values;
    expect(values.length, 2);
  });
}
