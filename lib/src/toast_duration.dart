/// Class for managing duration of showing Toast
class ToastDuration {
  /// Initialize a custom Toast duration
  const ToastDuration(this.duration, [this.value]);

  /// Value tag for native internally use duration
  final int value;

  /// Duration value in milliseconds
  final int duration;

  /// Show a Toast using short 2 seconds duration
  static const ToastDuration short = const ToastDuration(2000, 0);

  /// Show a Toast using short 3.5 seconds duration
  static const ToastDuration long = const ToastDuration(3500, 1);

  /// Return a list of predefined [ToastDuration] value
  static List<ToastDuration> get values => <ToastDuration>[
        short,
        long,
      ];
}
