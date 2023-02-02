import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:fcalc_interpreter/src/builtin_functions.dart';
import 'package:fcalc_interpreter/src/constants.dart';
import 'package:fcalc_interpreter/src/errors.dart';
import 'package:fcalc_interpreter/src/expr.dart';
import 'package:fcalc_interpreter/src/factorial.dart';
import 'package:fcalc_interpreter/src/parser.dart';
import 'package:fcalc_interpreter/src/token.dart';
import 'package:fcalc_interpreter/src/tokenizer.dart';

typedef BuiltinFunction = num Function(List<num> args);

class Env {
  final Map<String, num> _vars;
  final Map<String, FuncDefExpr> _funcs = {};
  static final Map<String, BuiltinFunction> _builtinFuncs = {
    'sin': BuiltinFunctions.sin,
    'cos': BuiltinFunctions.cos,
    'tan': BuiltinFunctions.tan,
    'ln': BuiltinFunctions.ln,
    'log': BuiltinFunctions.log,
    '√': BuiltinFunctions.sqrt,
    'mod': BuiltinFunctions.mod,
  };

  final Env? parent;

  Env(this.parent) : _vars = {};

  Env.global()
      : parent = null,
        _vars = {'π': math.pi, 'e': math.e};

  num? run(String input) {
    final tokens = tokenize(input).toBuiltList();
    final expr = Parser(tokens).parse();

    if (expr == null) {
      return null;
    }

    return _eval(expr);
  }

  num? _eval(Expr expr) {
    return expr.when(
      variable: (name) {
        final value = _findVar(name.text);
        if (value == null) {
          throw VariableUnddefinedError(name.text);
        }
        return value;
      },
      funcCall: (name, params) {
        final funcEnv = Env(this);
        final func = funcEnv._findFunc(name.text);
        final builtinFn = _builtinFuncs[name.text];
        if (func != null) {
          for (final param in params.asMap().entries) {
            final paramValue = _eval(param.value);
            if (paramValue == null) {
              return null;
            }
            funcEnv.setVar(func.args[param.key].text, paramValue);
          }

          return funcEnv._eval(func.body);
        }

        if (builtinFn != null) {
          final paramValues = <num>[];
          for (var param in params) {
            final value = _eval(param);
            if (value == null) {
              return null;
            }
            paramValues.add(value);
          }
          return builtinFn(paramValues);
        }

        throw FunctionUnddefinedError(name.text);
      },
      number: (value) => value,
      unary: (op, expr) {
        final value = _eval(expr);
        if (value == null) {
          return null;
        }
        switch (op.type) {
          case TokenType.degree:
            return value * radPerDeg;
          case TokenType.factorial:
            return factorial(value);
          case TokenType.percent:
            return value / 100;
          case TokenType.minus:
            return -(value);
          default:
            throw "unexpected operator";
        }
      },
      binary: (left, op, right) {
        final lvalue = _eval(left);
        final rvalue = _eval(right);
        if (rvalue == null || lvalue == null) {
          return null;
        }

        switch (op.type) {
          case TokenType.power:
            return math.pow(lvalue, rvalue);
          case TokenType.times:
            return lvalue * rvalue;
          case TokenType.divide:
            return lvalue / rvalue;
          case TokenType.plus:
            return lvalue + rvalue;
          case TokenType.minus:
            return lvalue - rvalue;
          default:
            throw "unexpected operator";
        }
      },
      funcDef: (name, args, body) {
        _funcs[name.text] = Expr.funcDef(name, args, body) as FuncDefExpr;
        return null;
      },
      varDef: (Token name, Expr expr) {
        final value = _eval(expr);
        if (value == null) {
          return null;
        }
        _vars[name.text] = value;
        return null;
      },
      group: (Expr expr) {
        return _eval(expr);
      },
    );
  }

  num? _findVar(String name) {
    final value = _vars[name];
    if (value == null) {
      return parent?._findVar(name);
    }
    return value;
  }

  FuncDefExpr? _findFunc(String name) {
    final value = _funcs[name];
    if (value == null) {
      return parent?._findFunc(name);
    }
    return value;
  }

  void setVar(String name, num value) {
    _vars[name] = value;
  }
}
