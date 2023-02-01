import 'package:equatable/equatable.dart';

enum TokenType {
  number,

  // arithmetic operators
  plus,
  minus,
  times,
  divide,
  percent,
  power,
  factorial,

  // grouping
  lparen,
  rparen,

  degree,

  identifier,
  equal,
  comma,
}

class Token extends Equatable {
  final TokenType type;
  final String text;

  Token({
    required this.type,
    required this.text,
  });

  @override
  List<Object?> get props => [type, text];

  static final Token plus = Token(type: TokenType.plus, text: '+');
  static final Token minus = Token(type: TokenType.minus, text: '-');
  static final Token times = Token(type: TokenType.times, text: '×');
  static final Token divide = Token(type: TokenType.divide, text: '/');
  static final Token percent = Token(type: TokenType.percent, text: '%');
  static final Token power = Token(type: TokenType.power, text: '^');
  static final Token factorial = Token(type: TokenType.factorial, text: '!');
  static final Token lparen = Token(type: TokenType.lparen, text: '(');
  static final Token rparen = Token(type: TokenType.rparen, text: ')');
  static final Token degree = Token(type: TokenType.degree, text: '°');
  static final Token equal = Token(type: TokenType.equal, text: '=');
  static final Token comma = Token(type: TokenType.comma, text: ',');
}
