import 'package:fcalc/history.dart';
import 'package:fcalc/init_script_service.dart';
import 'package:fcalc_interpreter/fcalc_interpreter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interpreter.dart';

class Calculate {
  final Interpreter _interpreter;
  final History _history;
  final InitScriptService _service;

  Calculate(this._interpreter, this._history, this._service) {
    init();
  }

  Future<void> init() async {
    final script = await _service.read();
    final cmds = script.split('\n');

    for (var cmd in cmds) {
      if (cmd.startsWith('#')) {
        return;
      }
      if (cmd.isEmpty) {
        return;
      }
      try {
        _interpreter.run(cmd);
      } catch (e) {
        _history.add(input: cmd, error: e.toString());
      }
    }
  }

  void call(String src) {
    try {
      final result = _interpreter.run(src);
      _history.add(input: src, result: result);
    } catch (e) {
      _history.add(input: src, error: e.toString());
    }
  }
}

final calculateProv = Provider(
  (ref) => Calculate(
    ref.watch(interpreterProv),
    ref.watch(historyProv.notifier),
    ref.watch(initScriptServiceProv),
  ),
);
