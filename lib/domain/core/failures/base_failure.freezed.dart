// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'base_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BaseFailureTearOff {
  const _$BaseFailureTearOff();

  _Unexpected unexpected() {
    return const _Unexpected();
  }

  _NotFound notFound() {
    return const _NotFound();
  }

  _Conflict conflict() {
    return const _Conflict();
  }

  _Unauthorized unauthorized() {
    return const _Unauthorized();
  }
}

/// @nodoc
const $BaseFailure = _$BaseFailureTearOff();

/// @nodoc
mixin _$BaseFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() conflict,
    required TResult Function() unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? conflict,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_Unauthorized value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseFailureCopyWith<$Res> {
  factory $BaseFailureCopyWith(BaseFailure value, $Res Function(BaseFailure) then) =
      _$BaseFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$BaseFailureCopyWithImpl<$Res> implements $BaseFailureCopyWith<$Res> {
  _$BaseFailureCopyWithImpl(this._value, this._then);

  final BaseFailure _value;
  // ignore: unused_field
  final $Res Function(BaseFailure) _then;
}

/// @nodoc
abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(_Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnexpectedCopyWithImpl<$Res> extends _$BaseFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(_Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

/// @nodoc
class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'BaseFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() conflict,
    required TResult Function() unauthorized,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? conflict,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements BaseFailure {
  const factory _Unexpected() = _$_Unexpected;
}

/// @nodoc
abstract class _$NotFoundCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) then) =
      __$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotFoundCopyWithImpl<$Res> extends _$BaseFailureCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(_NotFound _value, $Res Function(_NotFound) _then)
      : super(_value, (v) => _then(v as _NotFound));

  @override
  _NotFound get _value => super._value as _NotFound;
}

/// @nodoc
class _$_NotFound implements _NotFound {
  const _$_NotFound();

  @override
  String toString() {
    return 'BaseFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() conflict,
    required TResult Function() unauthorized,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? conflict,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements BaseFailure {
  const factory _NotFound() = _$_NotFound;
}

/// @nodoc
abstract class _$ConflictCopyWith<$Res> {
  factory _$ConflictCopyWith(_Conflict value, $Res Function(_Conflict) then) =
      __$ConflictCopyWithImpl<$Res>;
}

/// @nodoc
class __$ConflictCopyWithImpl<$Res> extends _$BaseFailureCopyWithImpl<$Res>
    implements _$ConflictCopyWith<$Res> {
  __$ConflictCopyWithImpl(_Conflict _value, $Res Function(_Conflict) _then)
      : super(_value, (v) => _then(v as _Conflict));

  @override
  _Conflict get _value => super._value as _Conflict;
}

/// @nodoc
class _$_Conflict implements _Conflict {
  const _$_Conflict();

  @override
  String toString() {
    return 'BaseFailure.conflict()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Conflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() conflict,
    required TResult Function() unauthorized,
  }) {
    return conflict();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? conflict,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class _Conflict implements BaseFailure {
  const factory _Conflict() = _$_Conflict;
}

/// @nodoc
abstract class _$UnauthorizedCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(_Unauthorized value, $Res Function(_Unauthorized) then) =
      __$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res> extends _$BaseFailureCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(_Unauthorized _value, $Res Function(_Unauthorized) _then)
      : super(_value, (v) => _then(v as _Unauthorized));

  @override
  _Unauthorized get _value => super._value as _Unauthorized;
}

/// @nodoc
class _$_Unauthorized implements _Unauthorized {
  const _$_Unauthorized();

  @override
  String toString() {
    return 'BaseFailure.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() conflict,
    required TResult Function() unauthorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? conflict,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_Conflict value) conflict,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_Conflict value)? conflict,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements BaseFailure {
  const factory _Unauthorized() = _$_Unauthorized;
}