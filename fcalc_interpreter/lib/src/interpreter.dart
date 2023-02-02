import 'package:fcalc_interpreter/src/env.dart';

class Interpreter {
  final globalEnv = Env.global();

  num? run(String src) => globalEnv.run(src);
}
