import 'package:fcalc_interpreter/src/token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expr.freezed.dart';

@freezed
class Expr with _$Expr {
  factory Expr.varDef(Token name, Expr expr) = VarDefExpr;
  factory Expr.variable(Token name) = VarExpr;
  factory Expr.funcDef(Token name, List<Token> args, Expr body) = FuncDefExpr;
  factory Expr.funcCall(Token name, List<Expr> params) = FuncCallExpr;
  factory Expr.number(num value) = NumberExpr;
  factory Expr.binary(Expr left, Token op, Expr right) = BinaryExpr;
  factory Expr.unary(Token op, Expr expr) = UnaryExpr;
  factory Expr.group(Expr expr) = GroupExpr;
}
