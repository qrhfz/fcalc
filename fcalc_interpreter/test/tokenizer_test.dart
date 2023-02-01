import 'package:built_collection/built_collection.dart';
import 'package:fcalc_interpreter/src/token.dart';
import 'package:fcalc_interpreter/src/tokenizer.dart';
import 'package:test/test.dart';

void main() {
  test('empty', () {
    final src = '';
    final actual = tokenize(src);

    expect(actual.length, 0);
  });

  test('one digit', () {
    final src = '1';
    final expected = [Token(type: TokenType.number, text: "1")];
    final actual = tokenize(src);

    expect(actual[0], expected[0]);
  });

  test('multi digit', () {
    final src = '123456';
    final expected =
        BuiltList.of([Token(type: TokenType.number, text: "123456")]);
    final actual = tokenize(src);

    expect(actual, expected);
  });

  test('decimal', () {
    final src = '123456.789';
    final expected =
        BuiltList.of([Token(type: TokenType.number, text: "123456.789")]);
    final actual = tokenize(src);

    expect(actual, expected);
  });

  test('operators', () {
    final src = '+-×/%^!()°=,';
    final expected = BuiltList.of([
      Token(type: TokenType.plus, text: "+"),
      Token(type: TokenType.minus, text: "-"),
      Token(type: TokenType.times, text: "×"),
      Token(type: TokenType.divide, text: "/"),
      Token(type: TokenType.percent, text: "%"),
      Token(type: TokenType.power, text: "^"),
      Token(type: TokenType.factorial, text: "!"),
      Token(type: TokenType.lparen, text: "("),
      Token(type: TokenType.rparen, text: ")"),
      Token(type: TokenType.degree, text: "°"),
      Token(type: TokenType.equal, text: "="),
      Token(type: TokenType.comma, text: ","),
    ]);
    final actual = tokenize(src);
    expect(actual, expected);
  });

  test('identifier', () {
    final src = 'abc_23';
    final expected = BuiltList.of([
      Token(type: TokenType.identifier, text: "abc_23"),
    ]);
    final actual = tokenize(src);
    expect(actual, expected);
  });

  test('function definition', () {
    final src = 'f(x,y) = x^y+2';
    final expected = BuiltList.of([
      Token(type: TokenType.identifier, text: "f"),
      Token(type: TokenType.lparen, text: "("),
      Token(type: TokenType.identifier, text: "x"),
      Token(type: TokenType.comma, text: ","),
      Token(type: TokenType.identifier, text: "y"),
      Token(type: TokenType.rparen, text: ")"),
      Token(type: TokenType.equal, text: "="),
      Token(type: TokenType.identifier, text: "x"),
      Token(type: TokenType.power, text: "^"),
      Token(type: TokenType.identifier, text: "y"),
      Token(type: TokenType.plus, text: "+"),
      Token(type: TokenType.number, text: "2"),
    ]);
    final actual = tokenize(src);
    expect(actual, expected);
  });
}
