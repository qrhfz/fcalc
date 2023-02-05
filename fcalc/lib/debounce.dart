import 'dart:async';

void Function(T) debounce<T>(
  Function(T) f, {
  Duration delay = const Duration(milliseconds: 100),
}) {
  Timer? timer;
  return (T arg) {
    timer?.cancel();
    timer = Timer(delay, () => f(arg));
  };
}
