import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:fcalc_interpreter/fcalc_interpreter.dart';

class InterpreterBenchmark extends BenchmarkBase {
  const InterpreterBenchmark() : super('Template');

  static void main() {
    const InterpreterBenchmark().report();
  }

  @override
  void run() {
    final interpreter = Interpreter();
    interpreter.run("f(x)=x^4-3×x^3+2×x^2-x+5");
    interpreter.run('f(7)');
  }

  @override
  void setup() {}

  @override
  void teardown() {}
}

void main() {
  InterpreterBenchmark.main();
}
