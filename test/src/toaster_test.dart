import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('EyroToastSetup', () {
    final shared = EyroToastSetup.shared;
    expect(shared, isNotNull);
    expect(shared.navigatorKey, isNull);

    shared.navigatorKey = GlobalKey();
    expect(shared.navigatorKey, isNotNull);
  });

  testWidgets('showToaster', (WidgetTester tester) async {
    bool flag;
    EyroToastSetup.shared.navigatorKey = GlobalKey();
    await tester.pumpWidget(MaterialApp(
      navigatorKey: EyroToastSetup.shared.navigatorKey,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.share),
          onPressed: () async {
            flag = await showToaster(
              text: 'This is a default short bottom Toaster',
            );
          },
        ),
      ),
    ));

    final shareFabFinder = find.byIcon(Icons.share);
    expect(shareFabFinder, findsOneWidget);

    await tester.tap(shareFabFinder);
    await tester.pump(Duration(seconds: 2));

    // this means that toaster has been shown
    expect(flag, isTrue);
  });
}
