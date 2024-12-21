// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkConnectivityException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoNetworkConnectivityException value) noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoNetworkConnectivityException value)? noNetwork,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoNetworkConnectivityException value)? noNetwork,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NetworkConnectivityException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkConnectivityExceptionCopyWith<NetworkConnectivityException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkConnectivityExceptionCopyWith<$Res> {
  factory $NetworkConnectivityExceptionCopyWith(
          NetworkConnectivityException value,
          $Res Function(NetworkConnectivityException) then) =
      _$NetworkConnectivityExceptionCopyWithImpl<$Res,
          NetworkConnectivityException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NetworkConnectivityExceptionCopyWithImpl<$Res,
        $Val extends NetworkConnectivityException>
    implements $NetworkConnectivityExceptionCopyWith<$Res> {
  _$NetworkConnectivityExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkConnectivityException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoNetworkConnectivityExceptionImplCopyWith<$Res>
    implements $NetworkConnectivityExceptionCopyWith<$Res> {
  factory _$$NoNetworkConnectivityExceptionImplCopyWith(
          _$NoNetworkConnectivityExceptionImpl value,
          $Res Function(_$NoNetworkConnectivityExceptionImpl) then) =
      __$$NoNetworkConnectivityExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoNetworkConnectivityExceptionImplCopyWithImpl<$Res>
    extends _$NetworkConnectivityExceptionCopyWithImpl<$Res,
        _$NoNetworkConnectivityExceptionImpl>
    implements _$$NoNetworkConnectivityExceptionImplCopyWith<$Res> {
  __$$NoNetworkConnectivityExceptionImplCopyWithImpl(
      _$NoNetworkConnectivityExceptionImpl _value,
      $Res Function(_$NoNetworkConnectivityExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkConnectivityException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoNetworkConnectivityExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoNetworkConnectivityExceptionImpl
    implements NoNetworkConnectivityException {
  const _$NoNetworkConnectivityExceptionImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkConnectivityException.noNetwork(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoNetworkConnectivityExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NetworkConnectivityException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoNetworkConnectivityExceptionImplCopyWith<
          _$NoNetworkConnectivityExceptionImpl>
      get copyWith => __$$NoNetworkConnectivityExceptionImplCopyWithImpl<
          _$NoNetworkConnectivityExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noNetwork,
  }) {
    return noNetwork(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noNetwork,
  }) {
    return noNetwork?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoNetworkConnectivityException value) noNetwork,
  }) {
    return noNetwork(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoNetworkConnectivityException value)? noNetwork,
  }) {
    return noNetwork?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoNetworkConnectivityException value)? noNetwork,
    required TResult orElse(),
  }) {
    if (noNetwork != null) {
      return noNetwork(this);
    }
    return orElse();
  }
}

abstract class NoNetworkConnectivityException
    implements NetworkConnectivityException {
  const factory NoNetworkConnectivityException(final String message) =
      _$NoNetworkConnectivityExceptionImpl;

  @override
  String get message;

  /// Create a copy of NetworkConnectivityException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoNetworkConnectivityExceptionImplCopyWith<
          _$NoNetworkConnectivityExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$APIException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiInternalServerException value) internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiInternalServerException value)? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiInternalServerException value)? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of APIException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $APIExceptionCopyWith<APIException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIExceptionCopyWith<$Res> {
  factory $APIExceptionCopyWith(
          APIException value, $Res Function(APIException) then) =
      _$APIExceptionCopyWithImpl<$Res, APIException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$APIExceptionCopyWithImpl<$Res, $Val extends APIException>
    implements $APIExceptionCopyWith<$Res> {
  _$APIExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of APIException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiInternalServerExceptionImplCopyWith<$Res>
    implements $APIExceptionCopyWith<$Res> {
  factory _$$ApiInternalServerExceptionImplCopyWith(
          _$ApiInternalServerExceptionImpl value,
          $Res Function(_$ApiInternalServerExceptionImpl) then) =
      __$$ApiInternalServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ApiInternalServerExceptionImplCopyWithImpl<$Res>
    extends _$APIExceptionCopyWithImpl<$Res, _$ApiInternalServerExceptionImpl>
    implements _$$ApiInternalServerExceptionImplCopyWith<$Res> {
  __$$ApiInternalServerExceptionImplCopyWithImpl(
      _$ApiInternalServerExceptionImpl _value,
      $Res Function(_$ApiInternalServerExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of APIException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ApiInternalServerExceptionImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApiInternalServerExceptionImpl implements ApiInternalServerException {
  const _$ApiInternalServerExceptionImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'APIException.internal(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiInternalServerExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of APIException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiInternalServerExceptionImplCopyWith<_$ApiInternalServerExceptionImpl>
      get copyWith => __$$ApiInternalServerExceptionImplCopyWithImpl<
          _$ApiInternalServerExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) internal,
  }) {
    return internal(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? internal,
  }) {
    return internal?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiInternalServerException value) internal,
  }) {
    return internal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiInternalServerException value)? internal,
  }) {
    return internal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiInternalServerException value)? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(this);
    }
    return orElse();
  }
}

abstract class ApiInternalServerException implements APIException {
  const factory ApiInternalServerException(final String message) =
      _$ApiInternalServerExceptionImpl;

  @override
  String get message;

  /// Create a copy of APIException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiInternalServerExceptionImplCopyWith<_$ApiInternalServerExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
