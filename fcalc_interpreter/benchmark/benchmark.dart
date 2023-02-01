import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:fcalc_interpreter/src/env.dart';

class InterpreterBenchmark extends BenchmarkBase {
  const InterpreterBenchmark() : super('Template');

  static void main() {
    const InterpreterBenchmark().report();
  }

  @override
  void run() {
    final env = Env.global();
    env.run("f(x)=x^4-3×x^3+2×x^2-x+5");
    env.run('f(7)');
  }

  @override
  void setup() {}

  @override
  void teardown() {}
}

void main() {
  InterpreterBenchmark.main();
}
