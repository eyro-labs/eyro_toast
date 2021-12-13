import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eyro_toast/eyro_toast.dart';
import 'package:eyro_toast/src/toast_widget.dart';

main() {
  testWidgets('Toast widget bottom', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: <Widget>[
            ToastWidget(
              widget: Text('This is widget'),
              gravity: ToastGravity.bottom,
            ),
          ],
        ),
      ),
    );

    final textFinder = find.text('This is widget');
    final positionedFinder = find.byType(Positioned);

    expect(textFinder, findsOneWidget);
    expect(positionedFinder, findsOneWidget);

    Positioned? positioned;
    for (int i = 0; i < tester.allWidgets.length; i++) {
      final widget = tester.allWidgets.elementAt(i);
      if (widget is Positioned) {
        positioned = widget;
        break;
      }
    }

    if (positioned != null) {
      expect(positioned.bottom, 50);
    }
  });

  testWidgets('Toast widget bottom', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: <Widget>[
            ToastWidget(
              widget: Text('This is widget'),
              gravity: ToastGravity.top,
            ),
          ],
        ),
      ),
    );

    final textFinder = find.text('This is widget');
    final positionedFinder = find.byType(Positioned);

    expect(textFinder, findsOneWidget);
    expect(positionedFinder, findsOneWidget);

    Positioned? positioned;
    for (int i = 0; i < tester.allWidgets.length; i++) {
      final widget = tester.allWidgets.elementAt(i);
      if (widget is Positioned) {
        positioned = widget;
        break;
      }
    }

    if (positioned != null) {
      expect(positioned.top, 50);
    }
  });

  testWidgets('Toast widget center', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: <Widget>[
            ToastWidget(
              widget: Text('This is widget'),
              gravity: ToastGravity.center,
            ),
          ],
        ),
      ),
    );

    final textFinder = find.text('This is widget');
    final positionedFinder = find.byType(Positioned);

    expect(textFinder, findsOneWidget);
    expect(positionedFinder, findsOneWidget);

    Positioned? positioned;
    for (int i = 0; i < tester.allWidgets.length; i++) {
      final widget = tester.allWidgets.elementAt(i);
      if (widget is Positioned) {
        positioned = widget;
        break;
      }
    }

    if (positioned != null) {
      expect(positioned.top, null);
      expect(positioned.bottom, null);
    }
  });
}
