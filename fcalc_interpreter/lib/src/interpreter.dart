import 'package:fcalc_interpreter/src/either.dart';
import 'package:fcalc_interpreter/src/env.dart';

class Interpreter {
  final globalEnv = Env.global();

  Either<num?, String> run(String src) {
    try {
      final result = globalEnv.run(src);
      return Either.ok(result);
    } catch (e) {
      return Either.error(e.toString());
    }
  }
}
