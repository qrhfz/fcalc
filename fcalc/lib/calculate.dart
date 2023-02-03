import 'package:fcalc/history.dart';
import 'package:fcalc_interpreter/fcalc_interpreter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interpreter.dart';

class Calculate {
  final Interpreter _interpreter;
  final History _history;

  Calculate(this._interpreter, this._history);

  void call(String src) {
    try {
      final result = _interpreter.run(src);
      _history.add(input: src, result: result);
    } catch (e) {
      _history.add(input: src, error: e.toString());
    }
  }
}

final calculateProv = Provider((ref) =>
    Calculate(ref.watch(interpreterProv), ref.watch(historyProv.notifier)));
