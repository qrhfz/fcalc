// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'either.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Either<Ok, Err> {
  Object? get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Ok value) ok,
    required TResult Function(Err value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Ok value)? ok,
    TResult? Function(Err value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Ok value)? ok,
    TResult Function(Err value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OK<Ok, Err> value) ok,
    required TResult Function(_Err<Ok, Err> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OK<Ok, Err> value)? ok,
    TResult? Function(_Err<Ok, Err> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OK<Ok, Err> value)? ok,
    TResult Function(_Err<Ok, Err> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EitherCopyWith<Ok, Err, $Res> {
  factory $EitherCopyWith(
          Either<Ok, Err> value, $Res Function(Either<Ok, Err>) then) =
      _$EitherCopyWithImpl<Ok, Err, $Res, Either<Ok, Err>>;
}

/// @nodoc
class _$EitherCopyWithImpl<Ok, Err, $Res, $Val extends Either<Ok, Err>>
    implements $EitherCopyWith<Ok, Err, $Res> {
  _$EitherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_OKCopyWith<Ok, Err, $Res> {
  factory _$$_OKCopyWith(
          _$_OK<Ok, Err> value, $Res Function(_$_OK<Ok, Err>) then) =
      __$$_OKCopyWithImpl<Ok, Err, $Res>;
  @useResult
  $Res call({Ok value});
}

/// @nodoc
class __$$_OKCopyWithImpl<Ok, Err, $Res>
    extends _$EitherCopyWithImpl<Ok, Err, $Res, _$_OK<Ok, Err>>
    implements _$$_OKCopyWith<Ok, Err, $Res> {
  __$$_OKCopyWithImpl(
      _$_OK<Ok, Err> _value, $Res Function(_$_OK<Ok, Err>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_OK<Ok, Err>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Ok,
    ));
  }
}

/// @nodoc

class _$_OK<Ok, Err> implements _OK<Ok, Err> {
  _$_OK(this.value);

  @override
  final Ok value;

  @override
  String toString() {
    return 'Either<$Ok, $Err>.ok(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OK<Ok, Err> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OKCopyWith<Ok, Err, _$_OK<Ok, Err>> get copyWith =>
      __$$_OKCopyWithImpl<Ok, Err, _$_OK<Ok, Err>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Ok value) ok,
    required TResult Function(Err value) error,
  }) {
    return ok(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Ok value)? ok,
    TResult? Function(Err value)? error,
  }) {
    return ok?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Ok value)? ok,
    TResult Function(Err value)? error,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OK<Ok, Err> value) ok,
    required TResult Function(_Err<Ok, Err> value) error,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OK<Ok, Err> value)? ok,
    TResult? Function(_Err<Ok, Err> value)? error,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OK<Ok, Err> value)? ok,
    TResult Function(_Err<Ok, Err> value)? error,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class _OK<Ok, Err> implements Either<Ok, Err> {
  factory _OK(final Ok value) = _$_OK<Ok, Err>;

  @override
  Ok get value;
  @JsonKey(ignore: true)
  _$$_OKCopyWith<Ok, Err, _$_OK<Ok, Err>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrCopyWith<Ok, Err, $Res> {
  factory _$$_ErrCopyWith(
          _$_Err<Ok, Err> value, $Res Function(_$_Err<Ok, Err>) then) =
      __$$_ErrCopyWithImpl<Ok, Err, $Res>;
  @useResult
  $Res call({Err value});
}

/// @nodoc
class __$$_ErrCopyWithImpl<Ok, Err, $Res>
    extends _$EitherCopyWithImpl<Ok, Err, $Res, _$_Err<Ok, Err>>
    implements _$$_ErrCopyWith<Ok, Err, $Res> {
  __$$_ErrCopyWithImpl(
      _$_Err<Ok, Err> _value, $Res Function(_$_Err<Ok, Err>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Err<Ok, Err>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Err,
    ));
  }
}

/// @nodoc

class _$_Err<Ok, Err> implements _Err<Ok, Err> {
  _$_Err(this.value);

  @override
  final Err value;

  @override
  String toString() {
    return 'Either<$Ok, $Err>.error(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Err<Ok, Err> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrCopyWith<Ok, Err, _$_Err<Ok, Err>> get copyWith =>
      __$$_ErrCopyWithImpl<Ok, Err, _$_Err<Ok, Err>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Ok value) ok,
    required TResult Function(Err value) error,
  }) {
    return error(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Ok value)? ok,
    TResult? Function(Err value)? error,
  }) {
    return error?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Ok value)? ok,
    TResult Function(Err value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OK<Ok, Err> value) ok,
    required TResult Function(_Err<Ok, Err> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OK<Ok, Err> value)? ok,
    TResult? Function(_Err<Ok, Err> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OK<Ok, Err> value)? ok,
    TResult Function(_Err<Ok, Err> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Err<Ok, Err> implements Either<Ok, Err> {
  factory _Err(final Err value) = _$_Err<Ok, Err>;

  @override
  Err get value;
  @JsonKey(ignore: true)
  _$$_ErrCopyWith<Ok, Err, _$_Err<Ok, Err>> get copyWith =>
      throw _privateConstructorUsedError;
}
