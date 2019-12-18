# Flutter Toast

[![Pub](https://img.shields.io/pub/v/flutter_toast)](https://pub.dev/packages/flutter_toast) [![Build Status](https://travis-ci.org/eyro-labs/flutter_toast.svg?branch=master)](https://travis-ci.org/eyro-labs/flutter_toast) [![Coverage Status](https://coveralls.io/repos/github/eyro-labs/flutter_toast/badge.svg?branch=master)](https://coveralls.io/github/eyro-labs/flutter_toast?branch=master) [![GitHub](https://img.shields.io/github/license/eyro-labs/flutter_toast?color=2196F3)](https://github.com/eyro-labs/flutter_toast/blob/master/LICENSE) [![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Feyro-labs%2Fflutter_toast.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Feyro-labs%2Fflutter_toast?ref=badge_shield)

A simple yet powerful Flutter plugin for showing Toast at Android and iOS.

Features:
* Native Toast
* Pure Flutter Toaster

## Installation

Add to pubspec.yaml:

```yaml
dependencies:
  flutter_toast: any
```

## Import Library
```dart   
import 'package:flutter_toast/flutter_toast.dart';
```

## Native Toast
```dart
// showing short Toast
await FlutterToast.showToast(
  text: 'This is short toast',
  duration: ToastDuration.short,
);

// showing long Toast
await FlutterToast.showToast(
  text: 'This is long toast',
  duration: ToastDuration.long,
);
```

## Pure Flutter Toaster

```dart
await showToaster(
  text: 'This is a centered Toaster',
  duration: ToastDuration.short,
  gravity: ToastGravity.bottom,
  borderRadius: const BorderRadius.all(Radius.circular(16)),
  backgroundColor: const Color(0xAA000000),
  fontColor: const Color(0xFFFFFFFF),
  textAlign: TextAlign.center,
  margin: const EdgeInsets.symmetric(horizontal: 16),
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  ),
  border: null,
);
```

## Author

Flutter HUD plugin is developed by Eyro Labs. You can contact us at <admin@cubeacon.com>.