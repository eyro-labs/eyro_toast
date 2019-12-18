import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toast/flutter_toast.dart';
import 'package:flutter_toast/src/toast_view.dart';
import 'package:flutter_toast/src/toast_widget.dart';

main() {
  test('ToastView setup', () {
    final shared = ToastView.shared;
    expect(shared, isNotNull);
  });

  testWidgets('ToastView create', (WidgetTester tester) async {
    FlutterToastSetup.shared.navigatorKey = GlobalKey();
    await tester.pumpWidget(MaterialApp(
      navigatorKey: FlutterToastSetup.shared.navigatorKey,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share),
          onPressed: () async {
            await ToastView.shared
                .create('This is a default short bottom Toaster')
                .showOnly();
          },
        ),
      ),
    ));

    final shareFabFinder = find.byIcon(Icons.share);
    expect(shareFabFinder, findsOneWidget);

    await tester.tap(shareFabFinder);

    await tester.pumpAndSettle();
    final toastWidgetFinder = find.byType(ToastWidget);
    expect(toastWidgetFinder, findsOneWidget);

    ToastView.shared.dismiss();
    await tester.pumpAndSettle();
    expect(toastWidgetFinder, findsNothing);
  });
}
