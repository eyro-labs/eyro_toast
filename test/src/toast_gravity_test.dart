import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toast/flutter_toast.dart';

void main() {
  test('Toast gravity top value equalTo "2"', () async {
    final gravity = ToastGravity.top;
    expect(gravity.value, 2);
  });

  test('Toast gravity center value equalTo "1"', () async {
    final gravity = ToastGravity.center;
    expect(gravity.value, 1);
  });

  test('Toast gravity bottom value equalTo "0"', () async {
    final gravity = ToastGravity.bottom;
    expect(gravity.value, 0);
  });

  test('Predefined toast gravity equalTo "3"', () async {
    final values = ToastGravity.values;
    expect(values.length, 3);
  });
}
