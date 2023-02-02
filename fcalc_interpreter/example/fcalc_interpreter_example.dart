import 'package:fcalc_interpreter/src/env.dart';
import 'dart:io';

void main() {
  final env = Env.global();

  for (;;) {
    stdout.write("> ");
    final input = stdin.readLineSync();
    if (input != null) {
      try {
        final result = env.run(input);
        stdout.writeln(result);
      } catch (e) {
        stdout.writeln(e);
      }
    }
  }
}
