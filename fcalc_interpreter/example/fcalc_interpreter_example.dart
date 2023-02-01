import 'package:fcalc_interpreter/fcalc_interpreter.dart';
import 'package:fcalc_interpreter/src/env.dart';

void main() {
  final formula = "fn(a,b)=a+b";
  final env = Env.global();

  print(env.run(formula));
  print(env.run("fn(10,20)"));
  print(env.run("sin(1.57)"));
  print(env.run("√(10×10×10×10)"));
  print(env.run("mod(5,3)"));
}
