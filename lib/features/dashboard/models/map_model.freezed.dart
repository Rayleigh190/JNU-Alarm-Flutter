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

PlacesResponseModel _$PlacesResponseModelFromJson(Map<String, dynamic> json) {
  return _PlacesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlacesResponseModel {
  List<PlaceModel> get data => throw _privateConstructorUsedError;

  /// Serializes this PlacesResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacesResponseModelCopyWith<PlacesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesResponseModelCopyWith<$Res> {
  factory $PlacesResponseModelCopyWith(
          PlacesResponseModel value, $Res Function(PlacesResponseModel) then) =
      _$PlacesResponseModelCopyWithImpl<$Res, PlacesResponseModel>;
  @useResult
  $Res call({List<PlaceModel> data});
}

/// @nodoc
class _$PlacesResponseModelCopyWithImpl<$Res, $Val extends PlacesResponseModel>
    implements $PlacesResponseModelCopyWith<$Res> {
  _$PlacesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacesResponseModelImplCopyWith<$Res>
    implements $PlacesResponseModelCopyWith<$Res> {
  factory _$$PlacesResponseModelImplCopyWith(_$PlacesResponseModelImpl value,
          $Res Function(_$PlacesResponseModelImpl) then) =
      __$$PlacesResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaceModel> data});
}

/// @nodoc
class __$$PlacesResponseModelImplCopyWithImpl<$Res>
    extends _$PlacesResponseModelCopyWithImpl<$Res, _$PlacesResponseModelImpl>
    implements _$$PlacesResponseModelImplCopyWith<$Res> {
  __$$PlacesResponseModelImplCopyWithImpl(_$PlacesResponseModelImpl _value,
      $Res Function(_$PlacesResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlacesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PlacesResponseModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacesResponseModelImpl implements _PlacesResponseModel {
  const _$PlacesResponseModelImpl({required final List<PlaceModel> data})
      : _data = data;

  factory _$PlacesResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacesResponseModelImplFromJson(json);

  final List<PlaceModel> _data;
  @override
  List<PlaceModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PlacesResponseModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesResponseModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of PlacesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesResponseModelImplCopyWith<_$PlacesResponseModelImpl> get copyWith =>
      __$$PlacesResponseModelImplCopyWithImpl<_$PlacesResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacesResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlacesResponseModel implements PlacesResponseModel {
  const factory _PlacesResponseModel({required final List<PlaceModel> data}) =
      _$PlacesResponseModelImpl;

  factory _PlacesResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlacesResponseModelImpl.fromJson;

  @override
  List<PlaceModel> get data;

  /// Create a copy of PlacesResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacesResponseModelImplCopyWith<_$PlacesResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  String get title => throw _privateConstructorUsedError;
  String get image_url => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get category_name => throw _privateConstructorUsedError;
  CoordModel get coord => throw _privateConstructorUsedError;

  /// Serializes this PlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call(
      {String title,
      String image_url,
      String description,
      String tag,
      String emoji,
      String category_name,
      CoordModel coord});

  $CoordModelCopyWith<$Res> get coord;
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image_url = null,
    Object? description = null,
    Object? tag = null,
    Object? emoji = null,
    Object? category_name = null,
    Object? coord = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      category_name: null == category_name
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      coord: null == coord
          ? _value.coord
          : coord // ignore: cast_nullable_to_non_nullable
              as CoordModel,
    ) as $Val);
  }

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordModelCopyWith<$Res> get coord {
    return $CoordModelCopyWith<$Res>(_value.coord, (value) {
      return _then(_value.copyWith(coord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
          _$PlaceModelImpl value, $Res Function(_$PlaceModelImpl) then) =
      __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String image_url,
      String description,
      String tag,
      String emoji,
      String category_name,
      CoordModel coord});

  @override
  $CoordModelCopyWith<$Res> get coord;
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
      _$PlaceModelImpl _value, $Res Function(_$PlaceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image_url = null,
    Object? description = null,
    Object? tag = null,
    Object? emoji = null,
    Object? category_name = null,
    Object? coord = null,
  }) {
    return _then(_$PlaceModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      category_name: null == category_name
          ? _value.category_name
          : category_name // ignore: cast_nullable_to_non_nullable
              as String,
      coord: null == coord
          ? _value.coord
          : coord // ignore: cast_nullable_to_non_nullable
              as CoordModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl(
      {required this.title,
      required this.image_url,
      required this.description,
      required this.tag,
      required this.emoji,
      required this.category_name,
      required this.coord});

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  @override
  final String title;
  @override
  final String image_url;
  @override
  final String description;
  @override
  final String tag;
  @override
  final String emoji;
  @override
  final String category_name;
  @override
  final CoordModel coord;

  @override
  String toString() {
    return 'PlaceModel(title: $title, image_url: $image_url, description: $description, tag: $tag, emoji: $emoji, category_name: $category_name, coord: $coord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.category_name, category_name) ||
                other.category_name == category_name) &&
            (identical(other.coord, coord) || other.coord == coord));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image_url, description,
      tag, emoji, category_name, coord);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel(
      {required final String title,
      required final String image_url,
      required final String description,
      required final String tag,
      required final String emoji,
      required final String category_name,
      required final CoordModel coord}) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  @override
  String get title;
  @override
  String get image_url;
  @override
  String get description;
  @override
  String get tag;
  @override
  String get emoji;
  @override
  String get category_name;
  @override
  CoordModel get coord;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoordModel _$CoordModelFromJson(Map<String, dynamic> json) {
  return _CoordModel.fromJson(json);
}

/// @nodoc
mixin _$CoordModel {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  /// Serializes this CoordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordModelCopyWith<CoordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordModelCopyWith<$Res> {
  factory $CoordModelCopyWith(
          CoordModel value, $Res Function(CoordModel) then) =
      _$CoordModelCopyWithImpl<$Res, CoordModel>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$CoordModelCopyWithImpl<$Res, $Val extends CoordModel>
    implements $CoordModelCopyWith<$Res> {
  _$CoordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordModelImplCopyWith<$Res>
    implements $CoordModelCopyWith<$Res> {
  factory _$$CoordModelImplCopyWith(
          _$CoordModelImpl value, $Res Function(_$CoordModelImpl) then) =
      __$$CoordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$CoordModelImplCopyWithImpl<$Res>
    extends _$CoordModelCopyWithImpl<$Res, _$CoordModelImpl>
    implements _$$CoordModelImplCopyWith<$Res> {
  __$$CoordModelImplCopyWithImpl(
      _$CoordModelImpl _value, $Res Function(_$CoordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$CoordModelImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordModelImpl implements _CoordModel {
  const _$CoordModelImpl({required this.lat, required this.lng});

  factory _$CoordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordModelImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'CoordModel(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordModelImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  /// Create a copy of CoordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordModelImplCopyWith<_$CoordModelImpl> get copyWith =>
      __$$CoordModelImplCopyWithImpl<_$CoordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordModelImplToJson(
      this,
    );
  }
}

abstract class _CoordModel implements CoordModel {
  const factory _CoordModel(
      {required final double lat,
      required final double lng}) = _$CoordModelImpl;

  factory _CoordModel.fromJson(Map<String, dynamic> json) =
      _$CoordModelImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;

  /// Create a copy of CoordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordModelImplCopyWith<_$CoordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
