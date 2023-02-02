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
}
