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

    return expr?.maybeMap(
      varDef: (variable) {
        _vars[variable.name.text] = _eval(variable.expr);
        return null;
      },
      funcDef: (func) {
        _funcs[func.name.text] = func;
        return null;
      },
      orElse: () {
        return _eval(expr);
      },
    );
  }

  num _eval(Expr expr) {
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
            funcEnv.setVar(func.args[param.key].text, _eval(param.value));
          }

          return funcEnv._eval(func.body);
        }

        if (builtinFn != null) {
          final pars = params.map((e) => _eval(e)).toList();
          return builtinFn(pars);
        }

        throw FunctionUnddefinedError(name.text);
      },
      number: (value) => value,
      unary: (op, expr) {
        switch (op.type) {
          case TokenType.degree:
            return _eval(expr) * radPerDeg;
          case TokenType.factorial:
            return factorial(_eval(expr));
          case TokenType.percent:
            return _eval(expr) / 100;
          case TokenType.minus:
            return -(_eval(expr));
          default:
            throw "unexpected operator";
        }
      },
      binary: (left, op, right) {
        switch (op.type) {
          case TokenType.power:
            return math.pow(_eval(left), _eval(right));
          case TokenType.times:
            return _eval(left) * _eval(right);
          case TokenType.divide:
            return _eval(left) / _eval(right);
          case TokenType.plus:
            return _eval(left) + _eval(right);
          case TokenType.minus:
            return _eval(left) - _eval(right);
          default:
            throw "unexpected operator";
        }
      },
      funcDef: (name, args, body) {
        throw "illegal function definition ${name.text}";
      },
      varDef: (Token name, Expr expr) {
        throw "illegal variable definition ${name.text}";
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
