import 'token.dart';

List<Token> tokenize(String src) {
  List<Token> tokens = [];
  Ref<int> cur = Ref(0);

  while (cur.value < src.length) {
    final ch = src[cur.value];

    if (_isDigit(ch)) {
      tokens.add(_number(src, cur));
      continue;
    }

    if (_isWhitespace(ch)) {
      cur.value++;
      continue;
    }

    switch (ch) {
      case "+":
        tokens.add(Token.plus);
        cur.value++;
        continue;
      case "-":
        tokens.add(Token.minus);
        cur.value++;
        continue;
      case '*':
      case "×":
        tokens.add(Token.times);
        cur.value++;
        continue;
      case "/":
        tokens.add(Token.divide);
        cur.value++;
        continue;
      case "%":
        tokens.add(Token.percent);
        cur.value++;
        continue;
      case "^":
        tokens.add(Token.power);
        cur.value++;
        continue;
      case "!":
        tokens.add(Token.factorial);
        cur.value++;
        continue;
      case "(":
        tokens.add(Token.lparen);
        cur.value++;
        continue;
      case ")":
        tokens.add(Token.rparen);
        cur.value++;
        continue;
      case "°":
        tokens.add(Token.degree);
        cur.value++;
        continue;
      case "=":
        tokens.add(Token.equal);
        cur.value++;
        continue;
      case ",":
        tokens.add(Token.comma);
        cur.value++;
        continue;
      default:
        tokens.add(_identifier(src, cur));
    }
  }

  return tokens;
}

bool _isWhitespace(String ch) {
  return ch == " ";
}

/// identifier cant contain these characters
const keychars = '+-×*/%^!()°=,';

/// doesnot start with number and doesn't inlcude operator character.
Token _identifier(String src, Ref<int> cur) {
  assert(!_isDigit(src[cur.value]));
  final start = cur.value;
  var i = start;
  while (i < src.length) {
    final ch = src[i];
    if (keychars.contains(ch)) {
      break;
    }

    if (ch == " ") {
      break;
    }
    i++;
  }
  cur.value = i;
  return Token(
    type: TokenType.identifier,
    text: src.substring(start, i),
  );
}

Token _number(String src, Ref<int> cur) {
  bool dot = false;
  final start = cur.value;
  int i;
  for (i = start + 1; i < src.length;) {
    final ch = src[i];
    if (_isDigit(ch)) {
      i++;
      continue;
    } else if (ch == '.' && !dot) {
      dot = true;
      i++;
      continue;
    } else {
      break;
    }
  }
  final end = i;
  cur.value = end;
  return Token(type: TokenType.number, text: src.substring(start, end));
}

bool _isDigit(String s) => (s.codeUnitAt(0) ^ 0x30) <= 9;

class Ref<T> {
  T value;
  Ref(this.value);
}
