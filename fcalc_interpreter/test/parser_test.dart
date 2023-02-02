import 'package:built_collection/built_collection.dart';
import 'package:fcalc_interpreter/src/expr.dart';
import 'package:fcalc_interpreter/src/parser.dart';
import 'package:fcalc_interpreter/src/token.dart';
import 'package:test/test.dart';

void main() {
  test('x=3/2+1', () {
    final tokens = [
      Token(type: TokenType.identifier, text: 'x'),
      Token(type: TokenType.equal, text: '='),
      Token(type: TokenType.number, text: '3'),
      Token(type: TokenType.divide, text: '/'),
      Token(type: TokenType.number, text: '2'),
      Token(type: TokenType.plus, text: '+'),
      Token(type: TokenType.number, text: '1'),
    ].toBuiltList();
    final parser = Parser(tokens);

    final expected = Expr.varDef(
      Token(type: TokenType.identifier, text: 'x'),
      Expr.binary(
        Expr.binary(
          Expr.number(3),
          Token(type: TokenType.divide, text: '/'),
          Expr.number(2),
        ),
        Token(type: TokenType.plus, text: '+'),
        Expr.number(1),
      ),
    );

    final actual = parser.parse();

    expect(actual, expected);
  });

  test('5-4^3*2', () {
    final tokens = [
      Token(type: TokenType.number, text: '5'),
      Token(type: TokenType.minus, text: '-'),
      Token(type: TokenType.number, text: '4'),
      Token(type: TokenType.power, text: '^'),
      Token(type: TokenType.number, text: '3'),
      Token(type: TokenType.times, text: '*'),
      Token(type: TokenType.number, text: '2'),
    ].toBuiltList();
    final parser = Parser(tokens);

    final expected = Expr.binary(
      Expr.number(5),
      Token(type: TokenType.minus, text: '-'),
      Expr.binary(
        Expr.binary(
          Expr.number(4),
          Token(type: TokenType.power, text: '^'),
          Expr.number(3),
        ),
        Token(type: TokenType.times, text: '*'),
        Expr.number(2),
      ),
    );

    final actual = parser.parse();

    expect(actual, expected);
  });

  test('f(x,y)=x^y', () {
    final tokens = [
      Token(type: TokenType.identifier, text: 'f'),
      Token(type: TokenType.lparen, text: '('),
      Token(type: TokenType.identifier, text: 'x'),
      Token(type: TokenType.comma, text: ','),
      Token(type: TokenType.identifier, text: 'y'),
      Token(type: TokenType.rparen, text: ')'),
      Token(type: TokenType.equal, text: '='),
      Token(type: TokenType.identifier, text: 'x'),
      Token(type: TokenType.power, text: '^'),
      Token(type: TokenType.identifier, text: 'y'),
    ].toBuiltList();
    final parser = Parser(tokens);

    final expected = Expr.funcDef(
      Token(type: TokenType.identifier, text: 'f'),
      [
        Token(type: TokenType.identifier, text: 'x'),
        Token(type: TokenType.identifier, text: 'y'),
      ],
      Expr.binary(
        Expr.variable(
          Token(type: TokenType.identifier, text: 'x'),
        ),
        Token(type: TokenType.power, text: '^'),
        Expr.variable(
          Token(type: TokenType.identifier, text: 'y'),
        ),
      ),
    );

    final actual = parser.parse();

    expect(actual, expected);
  });

  test('f(1,2)', () {
    final tokens = [
      Token(type: TokenType.identifier, text: 'f'),
      Token(type: TokenType.lparen, text: '('),
      Token(type: TokenType.number, text: '1'),
      Token(type: TokenType.comma, text: ','),
      Token(type: TokenType.number, text: '2'),
      Token(type: TokenType.rparen, text: ')'),
    ].toBuiltList();
    final parser = Parser(tokens);

    final expected = Expr.funcCall(
      Token(type: TokenType.identifier, text: 'f'),
      [
        Expr.number(1),
        Expr.number(2),
      ],
    );

    final actual = parser.parse();

    expect(actual, expected);
  });

  test('1+1+1+1+1', () {
    final tokens = [
      Token(type: TokenType.number, text: '1'),
      Token.plus,
      Token(type: TokenType.number, text: '1'),
      Token.plus,
      Token(type: TokenType.number, text: '1'),
      Token.plus,
      Token(type: TokenType.number, text: '1'),
      Token.plus,
      Token(type: TokenType.number, text: '1'),
    ].toBuiltList();
    final parser = Parser(tokens);

    final expected = Expr.binary(
      Expr.number(1),
      Token.plus,
      Expr.binary(
        Expr.binary(
          Expr.binary(
            Expr.number(1),
            Token.plus,
            Expr.number(1),
          ),
          Token.plus,
          Expr.number(1),
        ),
        Token.plus,
        Expr.number(1),
      ),
    );

    final actual = parser.parse();

    expect(actual, expected);
  });

  test('func call no argument', () {
    final tokens = [
      Token(type: TokenType.identifier, text: "x"),
      Token.lparen,
      Token.rparen,
    ].toBuiltList();
    final parser = Parser(tokens);
    final actual = parser.parse();

    expect(
      actual,
      Expr.funcCall(
        Token(type: TokenType.identifier, text: "x"),
        [],
      ),
    );
  });

  test('operation inside grouping', () {
    final tokens = [
      Token.lparen,
      Token(type: TokenType.number, text: "2"),
      Token.plus,
      Token(type: TokenType.number, text: "3"),
      Token.rparen,
      Token.times,
      Token(type: TokenType.number, text: "3"),
    ].toBuiltList();
    final parser = Parser(tokens);
    final actual = parser.parse();
    final expected = Expr.binary(
      Expr.group(
        Expr.binary(
          Expr.number(2),
          Token.plus,
          Expr.number(3),
        ),
      ),
      Token.times,
      Expr.number(3),
    );

    expect(actual, expected);
  });
}
