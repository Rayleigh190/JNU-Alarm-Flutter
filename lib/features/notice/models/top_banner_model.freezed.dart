// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopBannerResponseModel _$TopBannerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TopBannerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TopBannerResponseModel {
  bool get success => throw _privateConstructorUsedError;
  List<TopBannerModel> get response => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this TopBannerResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopBannerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopBannerResponseModelCopyWith<TopBannerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopBannerResponseModelCopyWith<$Res> {
  factory $TopBannerResponseModelCopyWith(TopBannerResponseModel value,
          $Res Function(TopBannerResponseModel) then) =
      _$TopBannerResponseModelCopyWithImpl<$Res, TopBannerResponseModel>;
  @useResult
  $Res call({bool success, List<TopBannerModel> response, String? error});
}

/// @nodoc
class _$TopBannerResponseModelCopyWithImpl<$Res,
        $Val extends TopBannerResponseModel>
    implements $TopBannerResponseModelCopyWith<$Res> {
  _$TopBannerResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopBannerResponseModel
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
              as List<TopBannerModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopBannerResponseModelImplCopyWith<$Res>
    implements $TopBannerResponseModelCopyWith<$Res> {
  factory _$$TopBannerResponseModelImplCopyWith(
          _$TopBannerResponseModelImpl value,
          $Res Function(_$TopBannerResponseModelImpl) then) =
      __$$TopBannerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<TopBannerModel> response, String? error});
}

/// @nodoc
class __$$TopBannerResponseModelImplCopyWithImpl<$Res>
    extends _$TopBannerResponseModelCopyWithImpl<$Res,
        _$TopBannerResponseModelImpl>
    implements _$$TopBannerResponseModelImplCopyWith<$Res> {
  __$$TopBannerResponseModelImplCopyWithImpl(
      _$TopBannerResponseModelImpl _value,
      $Res Function(_$TopBannerResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopBannerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? response = null,
    Object? error = freezed,
  }) {
    return _then(_$TopBannerResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<TopBannerModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopBannerResponseModelImpl implements _TopBannerResponseModel {
  const _$TopBannerResponseModelImpl(
      {required this.success,
      required final List<TopBannerModel> response,
      this.error})
      : _response = response;

  factory _$TopBannerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopBannerResponseModelImplFromJson(json);

  @override
  final bool success;
  final List<TopBannerModel> _response;
  @override
  List<TopBannerModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'TopBannerResponseModel(success: $success, response: $response, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopBannerResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._response, _response) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_response), error);

  /// Create a copy of TopBannerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopBannerResponseModelImplCopyWith<_$TopBannerResponseModelImpl>
      get copyWith => __$$TopBannerResponseModelImplCopyWithImpl<
          _$TopBannerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopBannerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TopBannerResponseModel implements TopBannerResponseModel {
  const factory _TopBannerResponseModel(
      {required final bool success,
      required final List<TopBannerModel> response,
      final String? error}) = _$TopBannerResponseModelImpl;

  factory _TopBannerResponseModel.fromJson(Map<String, dynamic> json) =
      _$TopBannerResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  List<TopBannerModel> get response;
  @override
  String? get error;

  /// Create a copy of TopBannerResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopBannerResponseModelImplCopyWith<_$TopBannerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TopBannerModel _$TopBannerModelFromJson(Map<String, dynamic> json) {
  return _TopBannerModel.fromJson(json);
}

/// @nodoc
mixin _$TopBannerModel {
  String get name => throw _privateConstructorUsedError;
  String get image_url => throw _privateConstructorUsedError;
  String get direction_url => throw _privateConstructorUsedError;
  DateTime get expiry_date => throw _privateConstructorUsedError;
  bool get is_external_browser => throw _privateConstructorUsedError;
  bool get is_available => throw _privateConstructorUsedError;

  /// Serializes this TopBannerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopBannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopBannerModelCopyWith<TopBannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopBannerModelCopyWith<$Res> {
  factory $TopBannerModelCopyWith(
          TopBannerModel value, $Res Function(TopBannerModel) then) =
      _$TopBannerModelCopyWithImpl<$Res, TopBannerModel>;
  @useResult
  $Res call(
      {String name,
      String image_url,
      String direction_url,
      DateTime expiry_date,
      bool is_external_browser,
      bool is_available});
}

/// @nodoc
class _$TopBannerModelCopyWithImpl<$Res, $Val extends TopBannerModel>
    implements $TopBannerModelCopyWith<$Res> {
  _$TopBannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopBannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image_url = null,
    Object? direction_url = null,
    Object? expiry_date = null,
    Object? is_external_browser = null,
    Object? is_available = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      direction_url: null == direction_url
          ? _value.direction_url
          : direction_url // ignore: cast_nullable_to_non_nullable
              as String,
      expiry_date: null == expiry_date
          ? _value.expiry_date
          : expiry_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_external_browser: null == is_external_browser
          ? _value.is_external_browser
          : is_external_browser // ignore: cast_nullable_to_non_nullable
              as bool,
      is_available: null == is_available
          ? _value.is_available
          : is_available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopBannerModelImplCopyWith<$Res>
    implements $TopBannerModelCopyWith<$Res> {
  factory _$$TopBannerModelImplCopyWith(_$TopBannerModelImpl value,
          $Res Function(_$TopBannerModelImpl) then) =
      __$$TopBannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String image_url,
      String direction_url,
      DateTime expiry_date,
      bool is_external_browser,
      bool is_available});
}

/// @nodoc
class __$$TopBannerModelImplCopyWithImpl<$Res>
    extends _$TopBannerModelCopyWithImpl<$Res, _$TopBannerModelImpl>
    implements _$$TopBannerModelImplCopyWith<$Res> {
  __$$TopBannerModelImplCopyWithImpl(
      _$TopBannerModelImpl _value, $Res Function(_$TopBannerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopBannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image_url = null,
    Object? direction_url = null,
    Object? expiry_date = null,
    Object? is_external_browser = null,
    Object? is_available = null,
  }) {
    return _then(_$TopBannerModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      direction_url: null == direction_url
          ? _value.direction_url
          : direction_url // ignore: cast_nullable_to_non_nullable
              as String,
      expiry_date: null == expiry_date
          ? _value.expiry_date
          : expiry_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_external_browser: null == is_external_browser
          ? _value.is_external_browser
          : is_external_browser // ignore: cast_nullable_to_non_nullable
              as bool,
      is_available: null == is_available
          ? _value.is_available
          : is_available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopBannerModelImpl implements _TopBannerModel {
  const _$TopBannerModelImpl(
      {required this.name,
      required this.image_url,
      required this.direction_url,
      required this.expiry_date,
      required this.is_external_browser,
      required this.is_available});

  factory _$TopBannerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopBannerModelImplFromJson(json);

  @override
  final String name;
  @override
  final String image_url;
  @override
  final String direction_url;
  @override
  final DateTime expiry_date;
  @override
  final bool is_external_browser;
  @override
  final bool is_available;

  @override
  String toString() {
    return 'TopBannerModel(name: $name, image_url: $image_url, direction_url: $direction_url, expiry_date: $expiry_date, is_external_browser: $is_external_browser, is_available: $is_available)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopBannerModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.direction_url, direction_url) ||
                other.direction_url == direction_url) &&
            (identical(other.expiry_date, expiry_date) ||
                other.expiry_date == expiry_date) &&
            (identical(other.is_external_browser, is_external_browser) ||
                other.is_external_browser == is_external_browser) &&
            (identical(other.is_available, is_available) ||
                other.is_available == is_available));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, image_url, direction_url,
      expiry_date, is_external_browser, is_available);

  /// Create a copy of TopBannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopBannerModelImplCopyWith<_$TopBannerModelImpl> get copyWith =>
      __$$TopBannerModelImplCopyWithImpl<_$TopBannerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopBannerModelImplToJson(
      this,
    );
  }
}

abstract class _TopBannerModel implements TopBannerModel {
  const factory _TopBannerModel(
      {required final String name,
      required final String image_url,
      required final String direction_url,
      required final DateTime expiry_date,
      required final bool is_external_browser,
      required final bool is_available}) = _$TopBannerModelImpl;

  factory _TopBannerModel.fromJson(Map<String, dynamic> json) =
      _$TopBannerModelImpl.fromJson;

  @override
  String get name;
  @override
  String get image_url;
  @override
  String get direction_url;
  @override
  DateTime get expiry_date;
  @override
  bool get is_external_browser;
  @override
  bool get is_available;

  /// Create a copy of TopBannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopBannerModelImplCopyWith<_$TopBannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
