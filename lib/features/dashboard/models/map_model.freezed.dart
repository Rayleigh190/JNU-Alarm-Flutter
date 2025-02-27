// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapResponseModel _$MapResponseModelFromJson(Map<String, dynamic> json) {
  return _MapResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MapResponseModel {
  List<TopCategoryModel> get top_categories =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this MapResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapResponseModelCopyWith<MapResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapResponseModelCopyWith<$Res> {
  factory $MapResponseModelCopyWith(
          MapResponseModel value, $Res Function(MapResponseModel) then) =
      _$MapResponseModelCopyWithImpl<$Res, MapResponseModel>;
  @useResult
  $Res call({List<TopCategoryModel> top_categories, String? error});
}

/// @nodoc
class _$MapResponseModelCopyWithImpl<$Res, $Val extends MapResponseModel>
    implements $MapResponseModelCopyWith<$Res> {
  _$MapResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top_categories = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      top_categories: null == top_categories
          ? _value.top_categories
          : top_categories // ignore: cast_nullable_to_non_nullable
              as List<TopCategoryModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapResponseModelImplCopyWith<$Res>
    implements $MapResponseModelCopyWith<$Res> {
  factory _$$MapResponseModelImplCopyWith(_$MapResponseModelImpl value,
          $Res Function(_$MapResponseModelImpl) then) =
      __$$MapResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TopCategoryModel> top_categories, String? error});
}

/// @nodoc
class __$$MapResponseModelImplCopyWithImpl<$Res>
    extends _$MapResponseModelCopyWithImpl<$Res, _$MapResponseModelImpl>
    implements _$$MapResponseModelImplCopyWith<$Res> {
  __$$MapResponseModelImplCopyWithImpl(_$MapResponseModelImpl _value,
      $Res Function(_$MapResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? top_categories = null,
    Object? error = freezed,
  }) {
    return _then(_$MapResponseModelImpl(
      top_categories: null == top_categories
          ? _value._top_categories
          : top_categories // ignore: cast_nullable_to_non_nullable
              as List<TopCategoryModel>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapResponseModelImpl implements _MapResponseModel {
  const _$MapResponseModelImpl(
      {required final List<TopCategoryModel> top_categories, this.error})
      : _top_categories = top_categories;

  factory _$MapResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapResponseModelImplFromJson(json);

  final List<TopCategoryModel> _top_categories;
  @override
  List<TopCategoryModel> get top_categories {
    if (_top_categories is EqualUnmodifiableListView) return _top_categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top_categories);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'MapResponseModel(top_categories: $top_categories, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._top_categories, _top_categories) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_top_categories), error);

  /// Create a copy of MapResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapResponseModelImplCopyWith<_$MapResponseModelImpl> get copyWith =>
      __$$MapResponseModelImplCopyWithImpl<_$MapResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MapResponseModel implements MapResponseModel {
  const factory _MapResponseModel(
      {required final List<TopCategoryModel> top_categories,
      final String? error}) = _$MapResponseModelImpl;

  factory _MapResponseModel.fromJson(Map<String, dynamic> json) =
      _$MapResponseModelImpl.fromJson;

  @override
  List<TopCategoryModel> get top_categories;
  @override
  String? get error;

  /// Create a copy of MapResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapResponseModelImplCopyWith<_$MapResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopCategoryModel _$TopCategoryModelFromJson(Map<String, dynamic> json) {
  return _TopCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$TopCategoryModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this TopCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopCategoryModelCopyWith<TopCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCategoryModelCopyWith<$Res> {
  factory $TopCategoryModelCopyWith(
          TopCategoryModel value, $Res Function(TopCategoryModel) then) =
      _$TopCategoryModelCopyWithImpl<$Res, TopCategoryModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$TopCategoryModelCopyWithImpl<$Res, $Val extends TopCategoryModel>
    implements $TopCategoryModelCopyWith<$Res> {
  _$TopCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopCategoryModelImplCopyWith<$Res>
    implements $TopCategoryModelCopyWith<$Res> {
  factory _$$TopCategoryModelImplCopyWith(_$TopCategoryModelImpl value,
          $Res Function(_$TopCategoryModelImpl) then) =
      __$$TopCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$TopCategoryModelImplCopyWithImpl<$Res>
    extends _$TopCategoryModelCopyWithImpl<$Res, _$TopCategoryModelImpl>
    implements _$$TopCategoryModelImplCopyWith<$Res> {
  __$$TopCategoryModelImplCopyWithImpl(_$TopCategoryModelImpl _value,
      $Res Function(_$TopCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$TopCategoryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopCategoryModelImpl implements _TopCategoryModel {
  const _$TopCategoryModelImpl({required this.name, required this.url});

  factory _$TopCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopCategoryModelImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'TopCategoryModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopCategoryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of TopCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopCategoryModelImplCopyWith<_$TopCategoryModelImpl> get copyWith =>
      __$$TopCategoryModelImplCopyWithImpl<_$TopCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _TopCategoryModel implements TopCategoryModel {
  const factory _TopCategoryModel(
      {required final String name,
      required final String url}) = _$TopCategoryModelImpl;

  factory _TopCategoryModel.fromJson(Map<String, dynamic> json) =
      _$TopCategoryModelImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of TopCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopCategoryModelImplCopyWith<_$TopCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
