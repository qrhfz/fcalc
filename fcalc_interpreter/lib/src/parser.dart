import 'package:built_collection/built_collection.dart';
import 'package:fcalc_interpreter/src/expr.dart';
import 'package:fcalc_interpreter/src/token.dart';

class Parser {
  final BuiltList<Token> tokens;
  int _cur = 0;

  Parser(this.tokens);

  Expr? parse() {
    final def = _definition();
    if (def != null) {
      return def;
    }

    return _expression();
  }

  Expr? _definition() {
    if (_peek()?.type == TokenType.identifier) {
      if (_peek(1)?.type == TokenType.equal) {
        return _variableDefinition();
      }

      return _func();
    }

    return null;
  }

  Expr? _variableDefinition() {
    final name = _consume();
    _consume();
    if (name != null) {
      final right = _expression();
      if (right == null) {
        return null;
      }

      return Expr.varDef(name, right);
    }
    return null;
  }

  Expr? _func() {
    int i = 1;

    if (_peek(i)?.type != TokenType.lparen) {
      return null;
    }

    i++;

    while (_peek(i)?.type == TokenType.identifier) {
      i++;
      if (_peek(i)?.type == TokenType.comma) {
        i++;
      }
    }

    if (_peek(i)?.type != TokenType.rparen) {
      return null;
    }

    final name = _consume();
    if (name == null) {
      return null;
    }

    final lparen = _consume();
    if (lparen?.type != TokenType.lparen) {
      return null;
    }

    List<Token> args = [];

    for (;;) {
      final nextArg = _peek();
      if (nextArg?.type != TokenType.identifier) {
        break;
      }
      args.add(_consume()!);
      if (_peek()?.type == TokenType.comma) {
        _consume();
      }
    }
    final rparen = _consume();
    if (rparen?.type != TokenType.rparen) {
      return null;
    }
    final eq = _consume();
    if (eq?.type != TokenType.equal) {
      return null;
    }
    final body = _expression();
    if (body == null) {
      return null;
    }
    return Expr.funcDef(name, args, body);
  }

  Expr? _expression() {
    return _term();
  }

  Expr? _term() {
    final left = _product();
    if (left == null) {
      return null;
    }

    final op = _consumeAny([TokenType.plus, TokenType.minus]);
    if (op == null) {
      return left;
    }

    var right = _product();
    if (right == null) {
      return null;
    }

    while (true) {
      final nextOp = _peek();
      if (nextOp?.type != TokenType.plus && nextOp?.type != TokenType.minus) {
        break;
      }
      _consume(); //consume the operator
      final nextRight = _product();
      if (nextRight == null) {
        break;
      }

      right = Expr.binary(right!, nextOp!, nextRight);
    }

    return Expr.binary(left, op, right!);
  }

  Expr? _product() {
    final left = _exponent();
    if (left == null) {
      return null;
    }

    final op = _consumeAny([TokenType.times, TokenType.divide]);
    if (op == null) {
      return left;
    }

    var right = _exponent();
    if (right == null) {
      return null;
    }

    while (true) {
      final nextOp = _peek();
      if (nextOp?.type != TokenType.times && nextOp?.type != TokenType.divide) {
        break;
      }
      _consume(); //consume the operator
      final nextRight = _exponent();
      if (nextRight == null) {
        break;
      }

      right = Expr.binary(right!, nextOp!, nextRight);
    }

    return Expr.binary(left, op, right!);
  }

  Expr? _exponent() {
    final left = _postfixUnary();
    if (left == null) {
      return null;
    }

    final op = _consumeAny([TokenType.power]);
    if (op == null) {
      return left;
    }

    var right = _postfixUnary();
    if (right == null) {
      return null;
    }

    while (true) {
      final nextOp = _peek();
      if (nextOp?.type != TokenType.power) {
        break;
      }
      _consume(); //consume the operator
      final nextRight = _postfixUnary();
      if (nextRight == null) {
        break;
      }

      right = Expr.binary(right!, nextOp!, nextRight);
    }

    return Expr.binary(left, op, right!);
  }

  Expr? _postfixUnary() {
    final expr = _prefixUnary();
    if (expr == null) {
      return null;
    }

    final op = _consumeAny([TokenType.degree, TokenType.factorial]);
    if (op == null) {
      return expr;
    }
    return Expr.unary(op, expr);
  }

  Expr? _prefixUnary() {
    final op = _consumeAny([TokenType.minus]);
    if (op == null) {
      return _funcCall();
    }

    final expr = _prefixUnary();
    if (expr == null) {
      return null;
    }

    return Expr.unary(op, expr);
  }

  Expr? _funcCall() {
    final identifierFound = _peek()?.type == TokenType.identifier;
    final lParenFound = _peek(1)?.type == TokenType.lparen;
    if (identifierFound && lParenFound) {
      final name = _consume();
      _consume(); // consume the left parentheses
      final params = <Expr>[];

      final expr = _expression();
      if (expr != null) {
        params.add(expr);
      }

      while (_peek()?.type == TokenType.comma) {
        _consume(); // consume comma
        final expr = _expression();
        if (expr != null) {
          params.add(expr);
        } else {
          break;
        }
      }
      _consume(); // consume the right parentheses

      return Expr.funcCall(name!, params);
    }

    return _primary();
  }

  Expr? _primary() {
    final name = _consumeAny([TokenType.identifier]);
    if (name != null) {
      return Expr.variable(name);
    }
    final lparen = _consumeAny([TokenType.lparen]);
    if (lparen != null) {
      final expr = _expression();
      if (expr == null) {
        return null;
      }
      return Expr.group(expr);
    }
    final number = _consumeAny([TokenType.number]);
    if (number != null) {
      final value = num.tryParse(number.text);
      if (value == null) {
        return null;
      }

      return Expr.number(value);
    }

    return null;
  }

  // utilities
  Token? _peek([int n = 0]) {
    if (_cur + n < tokens.length) {
      return tokens[_cur + n];
    }

    return null;
  }

  Token? _consume() {
    if (_cur < tokens.length) {
      _cur++;
      return tokens[_cur - 1];
    }
    return null;
  }

  Token? _consumeAny(List<TokenType> types) {
    if (types.contains(_peek()?.type)) {
      _cur++;
      return tokens[_cur - 1];
    }
    return null;
  }
}
