# Flutter Toast Example

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