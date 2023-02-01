import 'package:dart_numerics/dart_numerics.dart' as dn;

num factorial(num n) {
  if (n is double) {
    return dn.gamma(n);
  } else if (n is int) {
    return _intFactorial(n);
  }

  throw 'unreachable';
}

int _intFactorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }

  return result;
}
