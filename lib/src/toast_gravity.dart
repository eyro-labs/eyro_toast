/// Class for managing gravity of showing Toast
class ToastGravity {
  const ToastGravity._(this.value);

  /// Value tag for managing gravity
  final int value;

  /// Show a Toast with gravity top of screen
  static const ToastGravity top = ToastGravity._(2);

  /// Show a Toast with gravity center of screen
  static const ToastGravity center = ToastGravity._(1);

  /// Show a Toast with gravity bottom of screen
  static const ToastGravity bottom = ToastGravity._(0);

  /// Return a list of predefined [ToastGravity] value
  static List<ToastGravity> get values => [
        top,
        center,
        bottom,
      ];
}
