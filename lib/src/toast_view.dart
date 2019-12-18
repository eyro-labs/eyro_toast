import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toast/flutter_toast.dart';
import 'package:flutter_toast/src/toast_gravity.dart';
import 'package:flutter_toast/src/toast_widget.dart';

class ToastView {
  static final ToastView shared = ToastView._internal();

  ToastView._internal();

  OverlayState _overlayState;
  OverlayEntry _overlayEntry;
  bool _isVisible = false;

  ToastView create(
    String text, [
    ToastGravity gravity,
    Border border,
    BorderRadius borderRadius,
    Color backgroundColor,
    Color fontColor,
    TextAlign textAlign,
    EdgeInsets margin,
    EdgeInsets padding,
  ]) {
    assert(
        FlutterToastSetup.shared.navigatorKey != null,
        "You need to initialize and set [FlutterToastSetup.shared.navigatorKey] "
        "as your WidgetApp#navigatorKey before using Toaster");
    _overlayState = FlutterToastSetup.shared.navigatorKey.currentState.overlay;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
        widget: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                border: border,
              ),
              margin: margin,
              padding: padding,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.body1,
                child: Text(
                  text,
                  textAlign: textAlign,
                  softWrap: true,
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        gravity: gravity,
      ),
    );

    return this;
  }

  Future<void> show([ToastDuration duration]) async {
    await showOnly();
    await Future.delayed(
      Duration(
          milliseconds: duration?.duration ?? ToastDuration.short.duration),
      () => dismiss(),
    );
  }

  @visibleForTesting
  Future<void> showOnly() async {
    assert(
      _overlayState != null,
      'invoke ToastView#create first before showing it',
    );
    _isVisible = true;
    _overlayState.insert(_overlayEntry);
  }

  void dismiss() {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}
