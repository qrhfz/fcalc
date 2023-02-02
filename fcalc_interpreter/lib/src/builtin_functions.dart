import 'errors.dart';
import 'dart:math' as math;
import 'package:dart_numerics/dart_numerics.dart' as dn;

class BuiltinFunctions {
  BuiltinFunctions._();

  static num sin(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("sin", 1, args.length);
    }

    return math.sin(args[0]);
  }

  static num cos(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("cos", 1, args.length);
    }

    return math.cos(args[0]);
  }

  static num tan(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("tan", 1, args.length);
    }

    return math.tan(args[0]);
  }

  static num ln(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("ln", 1, args.length);
    }

    return math.log(args[0]);
  }

  static num log(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("log", 1, args.length);
    }
    return dn.log10(args[0]);
  }

  static num sqrt(List<num> args) {
    if (args.isEmpty) {
      throw ParameterError("√", 1, args.length);
    }
    return math.sqrt(args[0]);
  }

  static num mod(List<num> args) {
    if (args.length < 2) {
      throw ParameterError("mod", 2, args.length);
    }
    return args[0] % args[1];
  }
}
