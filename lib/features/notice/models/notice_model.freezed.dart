// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoticeResponseModel _$NoticeResponseModelFromJson(Map<String, dynamic> json) {
  return _NoticeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeResponseModel {
  bool get success => throw _privateConstructorUsedError;
  List<NoticeModel> get response => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this NoticeResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeResponseModelCopyWith<NoticeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeResponseModelCopyWith<$Res> {
  factory $NoticeResponseModelCopyWith(
          NoticeResponseModel value, $Res Function(NoticeResponseModel) then) =
      _$NoticeResponseModelCopyWithImpl<$Res, NoticeResponseModel>;
  @useResult
  $Res call({bool success, List<NoticeModel> response, String? error});
}

/// @nodoc
class _$NoticeResponseModelCopyWithImpl<$Res, $Val extends NoticeResponseModel>
    implements $NoticeResponseModelCopyWith<$Res> {
  _$NoticeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? response = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as List<NoticeModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeResponseModelImplCopyWith<$Res>
    implements $NoticeResponseModelCopyWith<$Res> {
  factory _$$NoticeResponseModelImplCopyWith(_$NoticeResponseModelImpl value,
          $Res Function(_$NoticeResponseModelImpl) then) =
      __$$NoticeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<NoticeModel> response, String? error});
}

/// @nodoc
class __$$NoticeResponseModelImplCopyWithImpl<$Res>
    extends _$NoticeResponseModelCopyWithImpl<$Res, _$NoticeResponseModelImpl>
    implements _$$NoticeResponseModelImplCopyWith<$Res> {
  __$$NoticeResponseModelImplCopyWithImpl(_$NoticeResponseModelImpl _value,
      $Res Function(_$NoticeResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? response = null,
    Object? error = freezed,
  }) {
    return _then(_$NoticeResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<NoticeModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeResponseModelImpl implements _NoticeResponseModel {
  const _$NoticeResponseModelImpl(
      {required this.success,
      required final List<NoticeModel> response,
      this.error})
      : _response = response;

  factory _$NoticeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeResponseModelImplFromJson(json);

  @override
  final bool success;
  final List<NoticeModel> _response;
  @override
  List<NoticeModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'NoticeResponseModel(success: $success, response: $response, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_response), error);

  /// Create a copy of NoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeResponseModelImplCopyWith<_$NoticeResponseModelImpl> get copyWith =>
      __$$NoticeResponseModelImplCopyWithImpl<_$NoticeResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _NoticeResponseModel implements NoticeResponseModel {
  const factory _NoticeResponseModel(
      {required final bool success,
      required final List<NoticeModel> response,
      final String? error}) = _$NoticeResponseModelImpl;

  factory _NoticeResponseModel.fromJson(Map<String, dynamic> json) =
      _$NoticeResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  List<NoticeModel> get response;
  @override
  String? get error;

  /// Create a copy of NoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeResponseModelImplCopyWith<_$NoticeResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) {
  return _NoticeModel.fromJson(json);
}

/// @nodoc
mixin _$NoticeModel {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;

  /// Serializes this NoticeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeModelCopyWith<NoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeModelCopyWith<$Res> {
  factory $NoticeModelCopyWith(
          NoticeModel value, $Res Function(NoticeModel) then) =
      _$NoticeModelCopyWithImpl<$Res, NoticeModel>;
  @useResult
  $Res call({String title, String body, String link, DateTime created_at});
}

/// @nodoc
class _$NoticeModelCopyWithImpl<$Res, $Val extends NoticeModel>
    implements $NoticeModelCopyWith<$Res> {
  _$NoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? link = null,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeModelImplCopyWith<$Res>
    implements $NoticeModelCopyWith<$Res> {
  factory _$$NoticeModelImplCopyWith(
          _$NoticeModelImpl value, $Res Function(_$NoticeModelImpl) then) =
      __$$NoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body, String link, DateTime created_at});
}

/// @nodoc
class __$$NoticeModelImplCopyWithImpl<$Res>
    extends _$NoticeModelCopyWithImpl<$Res, _$NoticeModelImpl>
    implements _$$NoticeModelImplCopyWith<$Res> {
  __$$NoticeModelImplCopyWithImpl(
      _$NoticeModelImpl _value, $Res Function(_$NoticeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? link = null,
    Object? created_at = null,
  }) {
    return _then(_$NoticeModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoticeModelImpl implements _NoticeModel {
  const _$NoticeModelImpl(
      {required this.title,
      required this.body,
      required this.link,
      required this.created_at});

  factory _$NoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoticeModelImplFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final String link;
  @override
  final DateTime created_at;

  @override
  String toString() {
    return 'NoticeModel(title: $title, body: $body, link: $link, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, body, link, created_at);

  /// Create a copy of NoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      __$$NoticeModelImplCopyWithImpl<_$NoticeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoticeModelImplToJson(
      this,
    );
  }
}

abstract class _NoticeModel implements NoticeModel {
  const factory _NoticeModel(
      {required final String title,
      required final String body,
      required final String link,
      required final DateTime created_at}) = _$NoticeModelImpl;

  factory _NoticeModel.fromJson(Map<String, dynamic> json) =
      _$NoticeModelImpl.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  String get link;
  @override
  DateTime get created_at;

  /// Create a copy of NoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeModelImplCopyWith<_$NoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
