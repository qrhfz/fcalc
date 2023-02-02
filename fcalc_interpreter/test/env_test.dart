import 'package:fcalc_interpreter/fcalc_interpreter.dart';
import 'package:test/test.dart';

void main() {
  late Env env;

  setUp(() {
    env = Env.global();
  });

  test('variable assignment', () {
    env.run("x = 1");

    expect(env.run("x"), 1);
  });

  test('degree', () {
    expect(env.run("90°"), 1.5707963267948966);
  });

  test('factorial', () {
    expect(env.run("3!"), 6);
  });

  test('percent', () {
    expect(env.run("3%"), 0.03);
  });

  test('unary minus', () {
    expect(env.run("-3"), -3);
  });

  test('plus', () {
    expect(env.run("2 + 2"), 4);
  });

  test('minus', () {
    expect(env.run("2 - 2"), 0);
  });

  test('times', () {
    expect(env.run("2 × 3"), 6);
  });

  test('divide', () {
    expect(env.run("6 / 2"), 3);
  });
}
