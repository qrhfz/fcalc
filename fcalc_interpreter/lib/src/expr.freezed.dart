// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Expr {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExprCopyWith<$Res> {
  factory $ExprCopyWith(Expr value, $Res Function(Expr) then) =
      _$ExprCopyWithImpl<$Res, Expr>;
}

/// @nodoc
class _$ExprCopyWithImpl<$Res, $Val extends Expr>
    implements $ExprCopyWith<$Res> {
  _$ExprCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VarDefExprCopyWith<$Res> {
  factory _$$VarDefExprCopyWith(
          _$VarDefExpr value, $Res Function(_$VarDefExpr) then) =
      __$$VarDefExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Token name, Expr expr});

  $ExprCopyWith<$Res> get expr;
}

/// @nodoc
class __$$VarDefExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$VarDefExpr>
    implements _$$VarDefExprCopyWith<$Res> {
  __$$VarDefExprCopyWithImpl(
      _$VarDefExpr _value, $Res Function(_$VarDefExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? expr = null,
  }) {
    return _then(_$VarDefExpr(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Token,
      null == expr
          ? _value.expr
          : expr // ignore: cast_nullable_to_non_nullable
              as Expr,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get expr {
    return $ExprCopyWith<$Res>(_value.expr, (value) {
      return _then(_value.copyWith(expr: value));
    });
  }
}

/// @nodoc

class _$VarDefExpr implements VarDefExpr {
  _$VarDefExpr(this.name, this.expr);

  @override
  final Token name;
  @override
  final Expr expr;

  @override
  String toString() {
    return 'Expr.varDef(name: $name, expr: $expr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VarDefExpr &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.expr, expr) || other.expr == expr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, expr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VarDefExprCopyWith<_$VarDefExpr> get copyWith =>
      __$$VarDefExprCopyWithImpl<_$VarDefExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return varDef(name, expr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return varDef?.call(name, expr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (varDef != null) {
      return varDef(name, expr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return varDef(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return varDef?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (varDef != null) {
      return varDef(this);
    }
    return orElse();
  }
}

abstract class VarDefExpr implements Expr {
  factory VarDefExpr(final Token name, final Expr expr) = _$VarDefExpr;

  Token get name;
  Expr get expr;
  @JsonKey(ignore: true)
  _$$VarDefExprCopyWith<_$VarDefExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VarExprCopyWith<$Res> {
  factory _$$VarExprCopyWith(_$VarExpr value, $Res Function(_$VarExpr) then) =
      __$$VarExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Token name});
}

/// @nodoc
class __$$VarExprCopyWithImpl<$Res> extends _$ExprCopyWithImpl<$Res, _$VarExpr>
    implements _$$VarExprCopyWith<$Res> {
  __$$VarExprCopyWithImpl(_$VarExpr _value, $Res Function(_$VarExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$VarExpr(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Token,
    ));
  }
}

/// @nodoc

class _$VarExpr implements VarExpr {
  _$VarExpr(this.name);

  @override
  final Token name;

  @override
  String toString() {
    return 'Expr.variable(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VarExpr &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VarExprCopyWith<_$VarExpr> get copyWith =>
      __$$VarExprCopyWithImpl<_$VarExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return variable(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return variable?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (variable != null) {
      return variable(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return variable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return variable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (variable != null) {
      return variable(this);
    }
    return orElse();
  }
}

abstract class VarExpr implements Expr {
  factory VarExpr(final Token name) = _$VarExpr;

  Token get name;
  @JsonKey(ignore: true)
  _$$VarExprCopyWith<_$VarExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FuncDefExprCopyWith<$Res> {
  factory _$$FuncDefExprCopyWith(
          _$FuncDefExpr value, $Res Function(_$FuncDefExpr) then) =
      __$$FuncDefExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Token name, List<Token> args, Expr body});

  $ExprCopyWith<$Res> get body;
}

/// @nodoc
class __$$FuncDefExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$FuncDefExpr>
    implements _$$FuncDefExprCopyWith<$Res> {
  __$$FuncDefExprCopyWithImpl(
      _$FuncDefExpr _value, $Res Function(_$FuncDefExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? args = null,
    Object? body = null,
  }) {
    return _then(_$FuncDefExpr(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Token,
      null == args
          ? _value._args
          : args // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as Expr,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get body {
    return $ExprCopyWith<$Res>(_value.body, (value) {
      return _then(_value.copyWith(body: value));
    });
  }
}

/// @nodoc

class _$FuncDefExpr implements FuncDefExpr {
  _$FuncDefExpr(this.name, final List<Token> args, this.body) : _args = args;

  @override
  final Token name;
  final List<Token> _args;
  @override
  List<Token> get args {
    if (_args is EqualUnmodifiableListView) return _args;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_args);
  }

  @override
  final Expr body;

  @override
  String toString() {
    return 'Expr.funcDef(name: $name, args: $args, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuncDefExpr &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._args, _args) &&
            (identical(other.body, body) || other.body == body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_args), body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FuncDefExprCopyWith<_$FuncDefExpr> get copyWith =>
      __$$FuncDefExprCopyWithImpl<_$FuncDefExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return funcDef(name, args, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return funcDef?.call(name, args, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (funcDef != null) {
      return funcDef(name, args, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return funcDef(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return funcDef?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (funcDef != null) {
      return funcDef(this);
    }
    return orElse();
  }
}

abstract class FuncDefExpr implements Expr {
  factory FuncDefExpr(
          final Token name, final List<Token> args, final Expr body) =
      _$FuncDefExpr;

  Token get name;
  List<Token> get args;
  Expr get body;
  @JsonKey(ignore: true)
  _$$FuncDefExprCopyWith<_$FuncDefExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FuncCallExprCopyWith<$Res> {
  factory _$$FuncCallExprCopyWith(
          _$FuncCallExpr value, $Res Function(_$FuncCallExpr) then) =
      __$$FuncCallExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Token name, List<Expr> params});
}

/// @nodoc
class __$$FuncCallExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$FuncCallExpr>
    implements _$$FuncCallExprCopyWith<$Res> {
  __$$FuncCallExprCopyWithImpl(
      _$FuncCallExpr _value, $Res Function(_$FuncCallExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? params = null,
  }) {
    return _then(_$FuncCallExpr(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Token,
      null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<Expr>,
    ));
  }
}

/// @nodoc

class _$FuncCallExpr implements FuncCallExpr {
  _$FuncCallExpr(this.name, final List<Expr> params) : _params = params;

  @override
  final Token name;
  final List<Expr> _params;
  @override
  List<Expr> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  String toString() {
    return 'Expr.funcCall(name: $name, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuncCallExpr &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FuncCallExprCopyWith<_$FuncCallExpr> get copyWith =>
      __$$FuncCallExprCopyWithImpl<_$FuncCallExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return funcCall(name, params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return funcCall?.call(name, params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (funcCall != null) {
      return funcCall(name, params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return funcCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return funcCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (funcCall != null) {
      return funcCall(this);
    }
    return orElse();
  }
}

abstract class FuncCallExpr implements Expr {
  factory FuncCallExpr(final Token name, final List<Expr> params) =
      _$FuncCallExpr;

  Token get name;
  List<Expr> get params;
  @JsonKey(ignore: true)
  _$$FuncCallExprCopyWith<_$FuncCallExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NumberExprCopyWith<$Res> {
  factory _$$NumberExprCopyWith(
          _$NumberExpr value, $Res Function(_$NumberExpr) then) =
      __$$NumberExprCopyWithImpl<$Res>;
  @useResult
  $Res call({num value});
}

/// @nodoc
class __$$NumberExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$NumberExpr>
    implements _$$NumberExprCopyWith<$Res> {
  __$$NumberExprCopyWithImpl(
      _$NumberExpr _value, $Res Function(_$NumberExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$NumberExpr(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$NumberExpr implements NumberExpr {
  _$NumberExpr(this.value);

  @override
  final num value;

  @override
  String toString() {
    return 'Expr.number(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberExpr &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberExprCopyWith<_$NumberExpr> get copyWith =>
      __$$NumberExprCopyWithImpl<_$NumberExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return number(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return number?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return number(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return number?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (number != null) {
      return number(this);
    }
    return orElse();
  }
}

abstract class NumberExpr implements Expr {
  factory NumberExpr(final num value) = _$NumberExpr;

  num get value;
  @JsonKey(ignore: true)
  _$$NumberExprCopyWith<_$NumberExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BinaryExprCopyWith<$Res> {
  factory _$$BinaryExprCopyWith(
          _$BinaryExpr value, $Res Function(_$BinaryExpr) then) =
      __$$BinaryExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Expr left, Token op, Expr right});

  $ExprCopyWith<$Res> get left;
  $ExprCopyWith<$Res> get right;
}

/// @nodoc
class __$$BinaryExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$BinaryExpr>
    implements _$$BinaryExprCopyWith<$Res> {
  __$$BinaryExprCopyWithImpl(
      _$BinaryExpr _value, $Res Function(_$BinaryExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? op = null,
    Object? right = null,
  }) {
    return _then(_$BinaryExpr(
      null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as Expr,
      null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as Token,
      null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as Expr,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get left {
    return $ExprCopyWith<$Res>(_value.left, (value) {
      return _then(_value.copyWith(left: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get right {
    return $ExprCopyWith<$Res>(_value.right, (value) {
      return _then(_value.copyWith(right: value));
    });
  }
}

/// @nodoc

class _$BinaryExpr implements BinaryExpr {
  _$BinaryExpr(this.left, this.op, this.right);

  @override
  final Expr left;
  @override
  final Token op;
  @override
  final Expr right;

  @override
  String toString() {
    return 'Expr.binary(left: $left, op: $op, right: $right)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BinaryExpr &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.right, right) || other.right == right));
  }

  @override
  int get hashCode => Object.hash(runtimeType, left, op, right);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BinaryExprCopyWith<_$BinaryExpr> get copyWith =>
      __$$BinaryExprCopyWithImpl<_$BinaryExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return binary(left, op, right);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return binary?.call(left, op, right);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (binary != null) {
      return binary(left, op, right);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return binary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return binary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (binary != null) {
      return binary(this);
    }
    return orElse();
  }
}

abstract class BinaryExpr implements Expr {
  factory BinaryExpr(final Expr left, final Token op, final Expr right) =
      _$BinaryExpr;

  Expr get left;
  Token get op;
  Expr get right;
  @JsonKey(ignore: true)
  _$$BinaryExprCopyWith<_$BinaryExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnaryExprCopyWith<$Res> {
  factory _$$UnaryExprCopyWith(
          _$UnaryExpr value, $Res Function(_$UnaryExpr) then) =
      __$$UnaryExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Token op, Expr expr});

  $ExprCopyWith<$Res> get expr;
}

/// @nodoc
class __$$UnaryExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$UnaryExpr>
    implements _$$UnaryExprCopyWith<$Res> {
  __$$UnaryExprCopyWithImpl(
      _$UnaryExpr _value, $Res Function(_$UnaryExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? op = null,
    Object? expr = null,
  }) {
    return _then(_$UnaryExpr(
      null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as Token,
      null == expr
          ? _value.expr
          : expr // ignore: cast_nullable_to_non_nullable
              as Expr,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get expr {
    return $ExprCopyWith<$Res>(_value.expr, (value) {
      return _then(_value.copyWith(expr: value));
    });
  }
}

/// @nodoc

class _$UnaryExpr implements UnaryExpr {
  _$UnaryExpr(this.op, this.expr);

  @override
  final Token op;
  @override
  final Expr expr;

  @override
  String toString() {
    return 'Expr.unary(op: $op, expr: $expr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnaryExpr &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.expr, expr) || other.expr == expr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, op, expr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnaryExprCopyWith<_$UnaryExpr> get copyWith =>
      __$$UnaryExprCopyWithImpl<_$UnaryExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return unary(op, expr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return unary?.call(op, expr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (unary != null) {
      return unary(op, expr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return unary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return unary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (unary != null) {
      return unary(this);
    }
    return orElse();
  }
}

abstract class UnaryExpr implements Expr {
  factory UnaryExpr(final Token op, final Expr expr) = _$UnaryExpr;

  Token get op;
  Expr get expr;
  @JsonKey(ignore: true)
  _$$UnaryExprCopyWith<_$UnaryExpr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupExprCopyWith<$Res> {
  factory _$$GroupExprCopyWith(
          _$GroupExpr value, $Res Function(_$GroupExpr) then) =
      __$$GroupExprCopyWithImpl<$Res>;
  @useResult
  $Res call({Expr expr});

  $ExprCopyWith<$Res> get expr;
}

/// @nodoc
class __$$GroupExprCopyWithImpl<$Res>
    extends _$ExprCopyWithImpl<$Res, _$GroupExpr>
    implements _$$GroupExprCopyWith<$Res> {
  __$$GroupExprCopyWithImpl(
      _$GroupExpr _value, $Res Function(_$GroupExpr) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expr = null,
  }) {
    return _then(_$GroupExpr(
      null == expr
          ? _value.expr
          : expr // ignore: cast_nullable_to_non_nullable
              as Expr,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExprCopyWith<$Res> get expr {
    return $ExprCopyWith<$Res>(_value.expr, (value) {
      return _then(_value.copyWith(expr: value));
    });
  }
}

/// @nodoc

class _$GroupExpr implements GroupExpr {
  _$GroupExpr(this.expr);

  @override
  final Expr expr;

  @override
  String toString() {
    return 'Expr.group(expr: $expr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupExpr &&
            (identical(other.expr, expr) || other.expr == expr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupExprCopyWith<_$GroupExpr> get copyWith =>
      __$$GroupExprCopyWithImpl<_$GroupExpr>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Token name, Expr expr) varDef,
    required TResult Function(Token name) variable,
    required TResult Function(Token name, List<Token> args, Expr body) funcDef,
    required TResult Function(Token name, List<Expr> params) funcCall,
    required TResult Function(num value) number,
    required TResult Function(Expr left, Token op, Expr right) binary,
    required TResult Function(Token op, Expr expr) unary,
    required TResult Function(Expr expr) group,
  }) {
    return group(expr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Token name, Expr expr)? varDef,
    TResult? Function(Token name)? variable,
    TResult? Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult? Function(Token name, List<Expr> params)? funcCall,
    TResult? Function(num value)? number,
    TResult? Function(Expr left, Token op, Expr right)? binary,
    TResult? Function(Token op, Expr expr)? unary,
    TResult? Function(Expr expr)? group,
  }) {
    return group?.call(expr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Token name, Expr expr)? varDef,
    TResult Function(Token name)? variable,
    TResult Function(Token name, List<Token> args, Expr body)? funcDef,
    TResult Function(Token name, List<Expr> params)? funcCall,
    TResult Function(num value)? number,
    TResult Function(Expr left, Token op, Expr right)? binary,
    TResult Function(Token op, Expr expr)? unary,
    TResult Function(Expr expr)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(expr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VarDefExpr value) varDef,
    required TResult Function(VarExpr value) variable,
    required TResult Function(FuncDefExpr value) funcDef,
    required TResult Function(FuncCallExpr value) funcCall,
    required TResult Function(NumberExpr value) number,
    required TResult Function(BinaryExpr value) binary,
    required TResult Function(UnaryExpr value) unary,
    required TResult Function(GroupExpr value) group,
  }) {
    return group(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VarDefExpr value)? varDef,
    TResult? Function(VarExpr value)? variable,
    TResult? Function(FuncDefExpr value)? funcDef,
    TResult? Function(FuncCallExpr value)? funcCall,
    TResult? Function(NumberExpr value)? number,
    TResult? Function(BinaryExpr value)? binary,
    TResult? Function(UnaryExpr value)? unary,
    TResult? Function(GroupExpr value)? group,
  }) {
    return group?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VarDefExpr value)? varDef,
    TResult Function(VarExpr value)? variable,
    TResult Function(FuncDefExpr value)? funcDef,
    TResult Function(FuncCallExpr value)? funcCall,
    TResult Function(NumberExpr value)? number,
    TResult Function(BinaryExpr value)? binary,
    TResult Function(UnaryExpr value)? unary,
    TResult Function(GroupExpr value)? group,
    required TResult orElse(),
  }) {
    if (group != null) {
      return group(this);
    }
    return orElse();
  }
}

abstract class GroupExpr implements Expr {
  factory GroupExpr(final Expr expr) = _$GroupExpr;

  Expr get expr;
  @JsonKey(ignore: true)
  _$$GroupExprCopyWith<_$GroupExpr> get copyWith =>
      throw _privateConstructorUsedError;
}
