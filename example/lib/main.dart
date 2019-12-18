import 'package:flutter/material.dart';

import 'package:flutter_toast/flutter_toast.dart';

void main() {
  FlutterToastSetup.shared.navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // don't forget to set the global navigator key
      // if you're using pure Flutter Toaster
      navigatorKey: FlutterToastSetup.shared.navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toast'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text('NATIVE TOAST'),
            ),
            Divider(height: 0),
            ListTile(
              title: Text('Toast Short'),
              subtitle: Text('Show toast for a short 2 seconds time'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await FlutterToast.showToast(
                  text: 'This is short toast',
                  duration: ToastDuration.short,
                );
              },
            ),
            Divider(height: 0),
            ListTile(
              title: Text('Toast Long'),
              subtitle: Text('Show toast for a long 3.5 seconds time'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await FlutterToast.showToast(
                  text: 'This is long toast',
                  duration: ToastDuration.long,
                );
              },
            ),
            Divider(height: 0),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text('PURE FLUTTER TOAST'),
            ),
            Divider(height: 0),
            ListTile(
              title: Text('5s Toaster'),
              subtitle: Text('Show toaster for a long 5 seconds time'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await showToaster(
                  text: 'As well as I know, this is a super long..long..and long toast ever shown',
                  duration: ToastDuration(5000),
                );
              },
            ),
            ListTile(
              title: Text('Centered Toaster'),
              subtitle: Text('Show toaster in centered screen'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await showToaster(
                  text: 'This is a centered Toaster',
                  gravity: ToastGravity.center,
                );
              },
            ),
            ListTile(
              title: Text('Top Red Toaster'),
              subtitle: Text('Show a red toaster in top screen'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await showToaster(
                  text: 'This is a centered Toaster',
                  gravity: ToastGravity.top,
                  backgroundColor: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
