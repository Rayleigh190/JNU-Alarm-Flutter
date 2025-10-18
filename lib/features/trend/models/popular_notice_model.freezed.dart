// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_notice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PopularNoticeResponseModel _$PopularNoticeResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PopularNoticeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PopularNoticeResponseModel {
  bool get success => throw _privateConstructorUsedError;
  PopularNoticeListModel get response => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this PopularNoticeResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularNoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularNoticeResponseModelCopyWith<PopularNoticeResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularNoticeResponseModelCopyWith<$Res> {
  factory $PopularNoticeResponseModelCopyWith(PopularNoticeResponseModel value,
          $Res Function(PopularNoticeResponseModel) then) =
      _$PopularNoticeResponseModelCopyWithImpl<$Res,
          PopularNoticeResponseModel>;
  @useResult
  $Res call({bool success, PopularNoticeListModel response, String? error});

  $PopularNoticeListModelCopyWith<$Res> get response;
}

/// @nodoc
class _$PopularNoticeResponseModelCopyWithImpl<$Res,
        $Val extends PopularNoticeResponseModel>
    implements $PopularNoticeResponseModelCopyWith<$Res> {
  _$PopularNoticeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularNoticeResponseModel
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
              as PopularNoticeListModel,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PopularNoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PopularNoticeListModelCopyWith<$Res> get response {
    return $PopularNoticeListModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PopularNoticeResponseModelImplCopyWith<$Res>
    implements $PopularNoticeResponseModelCopyWith<$Res> {
  factory _$$PopularNoticeResponseModelImplCopyWith(
          _$PopularNoticeResponseModelImpl value,
          $Res Function(_$PopularNoticeResponseModelImpl) then) =
      __$$PopularNoticeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, PopularNoticeListModel response, String? error});

  @override
  $PopularNoticeListModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$PopularNoticeResponseModelImplCopyWithImpl<$Res>
    extends _$PopularNoticeResponseModelCopyWithImpl<$Res,
        _$PopularNoticeResponseModelImpl>
    implements _$$PopularNoticeResponseModelImplCopyWith<$Res> {
  __$$PopularNoticeResponseModelImplCopyWithImpl(
      _$PopularNoticeResponseModelImpl _value,
      $Res Function(_$PopularNoticeResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularNoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? response = null,
    Object? error = freezed,
  }) {
    return _then(_$PopularNoticeResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as PopularNoticeListModel,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularNoticeResponseModelImpl implements _PopularNoticeResponseModel {
  const _$PopularNoticeResponseModelImpl(
      {required this.success, required this.response, this.error});

  factory _$PopularNoticeResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PopularNoticeResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final PopularNoticeListModel response;
  @override
  final String? error;

  @override
  String toString() {
    return 'PopularNoticeResponseModel(success: $success, response: $response, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularNoticeResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, response, error);

  /// Create a copy of PopularNoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularNoticeResponseModelImplCopyWith<_$PopularNoticeResponseModelImpl>
      get copyWith => __$$PopularNoticeResponseModelImplCopyWithImpl<
          _$PopularNoticeResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularNoticeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PopularNoticeResponseModel
    implements PopularNoticeResponseModel {
  const factory _PopularNoticeResponseModel(
      {required final bool success,
      required final PopularNoticeListModel response,
      final String? error}) = _$PopularNoticeResponseModelImpl;

  factory _PopularNoticeResponseModel.fromJson(Map<String, dynamic> json) =
      _$PopularNoticeResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  PopularNoticeListModel get response;
  @override
  String? get error;

  /// Create a copy of PopularNoticeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularNoticeResponseModelImplCopyWith<_$PopularNoticeResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PopularNoticeListModel _$PopularNoticeListModelFromJson(
    Map<String, dynamic> json) {
  return _PopularNoticeListModel.fromJson(json);
}

/// @nodoc
mixin _$PopularNoticeListModel {
  List<PopularNoticeModel> get daily_top => throw _privateConstructorUsedError;
  List<PopularNoticeModel> get weekly_top => throw _privateConstructorUsedError;

  /// Serializes this PopularNoticeListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularNoticeListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularNoticeListModelCopyWith<PopularNoticeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularNoticeListModelCopyWith<$Res> {
  factory $PopularNoticeListModelCopyWith(PopularNoticeListModel value,
          $Res Function(PopularNoticeListModel) then) =
      _$PopularNoticeListModelCopyWithImpl<$Res, PopularNoticeListModel>;
  @useResult
  $Res call(
      {List<PopularNoticeModel> daily_top,
      List<PopularNoticeModel> weekly_top});
}

/// @nodoc
class _$PopularNoticeListModelCopyWithImpl<$Res,
        $Val extends PopularNoticeListModel>
    implements $PopularNoticeListModelCopyWith<$Res> {
  _$PopularNoticeListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularNoticeListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily_top = null,
    Object? weekly_top = null,
  }) {
    return _then(_value.copyWith(
      daily_top: null == daily_top
          ? _value.daily_top
          : daily_top // ignore: cast_nullable_to_non_nullable
              as List<PopularNoticeModel>,
      weekly_top: null == weekly_top
          ? _value.weekly_top
          : weekly_top // ignore: cast_nullable_to_non_nullable
              as List<PopularNoticeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularNoticeListModelImplCopyWith<$Res>
    implements $PopularNoticeListModelCopyWith<$Res> {
  factory _$$PopularNoticeListModelImplCopyWith(
          _$PopularNoticeListModelImpl value,
          $Res Function(_$PopularNoticeListModelImpl) then) =
      __$$PopularNoticeListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PopularNoticeModel> daily_top,
      List<PopularNoticeModel> weekly_top});
}

/// @nodoc
class __$$PopularNoticeListModelImplCopyWithImpl<$Res>
    extends _$PopularNoticeListModelCopyWithImpl<$Res,
        _$PopularNoticeListModelImpl>
    implements _$$PopularNoticeListModelImplCopyWith<$Res> {
  __$$PopularNoticeListModelImplCopyWithImpl(
      _$PopularNoticeListModelImpl _value,
      $Res Function(_$PopularNoticeListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularNoticeListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily_top = null,
    Object? weekly_top = null,
  }) {
    return _then(_$PopularNoticeListModelImpl(
      daily_top: null == daily_top
          ? _value._daily_top
          : daily_top // ignore: cast_nullable_to_non_nullable
              as List<PopularNoticeModel>,
      weekly_top: null == weekly_top
          ? _value._weekly_top
          : weekly_top // ignore: cast_nullable_to_non_nullable
              as List<PopularNoticeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularNoticeListModelImpl implements _PopularNoticeListModel {
  const _$PopularNoticeListModelImpl(
      {required final List<PopularNoticeModel> daily_top,
      required final List<PopularNoticeModel> weekly_top})
      : _daily_top = daily_top,
        _weekly_top = weekly_top;

  factory _$PopularNoticeListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularNoticeListModelImplFromJson(json);

  final List<PopularNoticeModel> _daily_top;
  @override
  List<PopularNoticeModel> get daily_top {
    if (_daily_top is EqualUnmodifiableListView) return _daily_top;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daily_top);
  }

  final List<PopularNoticeModel> _weekly_top;
  @override
  List<PopularNoticeModel> get weekly_top {
    if (_weekly_top is EqualUnmodifiableListView) return _weekly_top;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekly_top);
  }

  @override
  String toString() {
    return 'PopularNoticeListModel(daily_top: $daily_top, weekly_top: $weekly_top)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularNoticeListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._daily_top, _daily_top) &&
            const DeepCollectionEquality()
                .equals(other._weekly_top, _weekly_top));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_daily_top),
      const DeepCollectionEquality().hash(_weekly_top));

  /// Create a copy of PopularNoticeListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularNoticeListModelImplCopyWith<_$PopularNoticeListModelImpl>
      get copyWith => __$$PopularNoticeListModelImplCopyWithImpl<
          _$PopularNoticeListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularNoticeListModelImplToJson(
      this,
    );
  }
}

abstract class _PopularNoticeListModel implements PopularNoticeListModel {
  const factory _PopularNoticeListModel(
          {required final List<PopularNoticeModel> daily_top,
          required final List<PopularNoticeModel> weekly_top}) =
      _$PopularNoticeListModelImpl;

  factory _PopularNoticeListModel.fromJson(Map<String, dynamic> json) =
      _$PopularNoticeListModelImpl.fromJson;

  @override
  List<PopularNoticeModel> get daily_top;
  @override
  List<PopularNoticeModel> get weekly_top;

  /// Create a copy of PopularNoticeListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularNoticeListModelImplCopyWith<_$PopularNoticeListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PopularNoticeModel _$PopularNoticeModelFromJson(Map<String, dynamic> json) {
  return _PopularNoticeModel.fromJson(json);
}

/// @nodoc
mixin _$PopularNoticeModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  int? get daily_hits => throw _privateConstructorUsedError;
  String? get trend => throw _privateConstructorUsedError;
  int? get weekly_hits => throw _privateConstructorUsedError;

  /// Serializes this PopularNoticeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PopularNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PopularNoticeModelCopyWith<PopularNoticeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopularNoticeModelCopyWith<$Res> {
  factory $PopularNoticeModelCopyWith(
          PopularNoticeModel value, $Res Function(PopularNoticeModel) then) =
      _$PopularNoticeModelCopyWithImpl<$Res, PopularNoticeModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String link,
      int? daily_hits,
      String? trend,
      int? weekly_hits});
}

/// @nodoc
class _$PopularNoticeModelCopyWithImpl<$Res, $Val extends PopularNoticeModel>
    implements $PopularNoticeModelCopyWith<$Res> {
  _$PopularNoticeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PopularNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? link = null,
    Object? daily_hits = freezed,
    Object? trend = freezed,
    Object? weekly_hits = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      daily_hits: freezed == daily_hits
          ? _value.daily_hits
          : daily_hits // ignore: cast_nullable_to_non_nullable
              as int?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String?,
      weekly_hits: freezed == weekly_hits
          ? _value.weekly_hits
          : weekly_hits // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PopularNoticeModelImplCopyWith<$Res>
    implements $PopularNoticeModelCopyWith<$Res> {
  factory _$$PopularNoticeModelImplCopyWith(_$PopularNoticeModelImpl value,
          $Res Function(_$PopularNoticeModelImpl) then) =
      __$$PopularNoticeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String link,
      int? daily_hits,
      String? trend,
      int? weekly_hits});
}

/// @nodoc
class __$$PopularNoticeModelImplCopyWithImpl<$Res>
    extends _$PopularNoticeModelCopyWithImpl<$Res, _$PopularNoticeModelImpl>
    implements _$$PopularNoticeModelImplCopyWith<$Res> {
  __$$PopularNoticeModelImplCopyWithImpl(_$PopularNoticeModelImpl _value,
      $Res Function(_$PopularNoticeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PopularNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? link = null,
    Object? daily_hits = freezed,
    Object? trend = freezed,
    Object? weekly_hits = freezed,
  }) {
    return _then(_$PopularNoticeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      daily_hits: freezed == daily_hits
          ? _value.daily_hits
          : daily_hits // ignore: cast_nullable_to_non_nullable
              as int?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String?,
      weekly_hits: freezed == weekly_hits
          ? _value.weekly_hits
          : weekly_hits // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PopularNoticeModelImpl implements _PopularNoticeModel {
  const _$PopularNoticeModelImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.link,
      this.daily_hits,
      this.trend,
      this.weekly_hits});

  factory _$PopularNoticeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PopularNoticeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String link;
  @override
  final int? daily_hits;
  @override
  final String? trend;
  @override
  final int? weekly_hits;

  @override
  String toString() {
    return 'PopularNoticeModel(id: $id, title: $title, body: $body, link: $link, daily_hits: $daily_hits, trend: $trend, weekly_hits: $weekly_hits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopularNoticeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.daily_hits, daily_hits) ||
                other.daily_hits == daily_hits) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.weekly_hits, weekly_hits) ||
                other.weekly_hits == weekly_hits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, link, daily_hits, trend, weekly_hits);

  /// Create a copy of PopularNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopularNoticeModelImplCopyWith<_$PopularNoticeModelImpl> get copyWith =>
      __$$PopularNoticeModelImplCopyWithImpl<_$PopularNoticeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PopularNoticeModelImplToJson(
      this,
    );
  }
}

abstract class _PopularNoticeModel implements PopularNoticeModel {
  const factory _PopularNoticeModel(
      {required final int id,
      required final String title,
      required final String body,
      required final String link,
      final int? daily_hits,
      final String? trend,
      final int? weekly_hits}) = _$PopularNoticeModelImpl;

  factory _PopularNoticeModel.fromJson(Map<String, dynamic> json) =
      _$PopularNoticeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get link;
  @override
  int? get daily_hits;
  @override
  String? get trend;
  @override
  int? get weekly_hits;

  /// Create a copy of PopularNoticeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopularNoticeModelImplCopyWith<_$PopularNoticeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
