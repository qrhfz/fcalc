import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
class Either<Ok, Err> with _$Either<Ok, Err> {
  factory Either.ok(Ok value) = _OK;
  factory Either.error(Err value) = _Err;
}
