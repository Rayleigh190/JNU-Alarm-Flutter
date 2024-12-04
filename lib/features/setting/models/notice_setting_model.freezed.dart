// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notice_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NoticeSettingModel {
  Map<String, bool> get topics => throw _privateConstructorUsedError;

  /// Create a copy of NoticeSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoticeSettingModelCopyWith<NoticeSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticeSettingModelCopyWith<$Res> {
  factory $NoticeSettingModelCopyWith(
          NoticeSettingModel value, $Res Function(NoticeSettingModel) then) =
      _$NoticeSettingModelCopyWithImpl<$Res, NoticeSettingModel>;
  @useResult
  $Res call({Map<String, bool> topics});
}

/// @nodoc
class _$NoticeSettingModelCopyWithImpl<$Res, $Val extends NoticeSettingModel>
    implements $NoticeSettingModelCopyWith<$Res> {
  _$NoticeSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoticeSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoticeSettingModelImplCopyWith<$Res>
    implements $NoticeSettingModelCopyWith<$Res> {
  factory _$$NoticeSettingModelImplCopyWith(_$NoticeSettingModelImpl value,
          $Res Function(_$NoticeSettingModelImpl) then) =
      __$$NoticeSettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, bool> topics});
}

/// @nodoc
class __$$NoticeSettingModelImplCopyWithImpl<$Res>
    extends _$NoticeSettingModelCopyWithImpl<$Res, _$NoticeSettingModelImpl>
    implements _$$NoticeSettingModelImplCopyWith<$Res> {
  __$$NoticeSettingModelImplCopyWithImpl(_$NoticeSettingModelImpl _value,
      $Res Function(_$NoticeSettingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoticeSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_$NoticeSettingModelImpl(
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$NoticeSettingModelImpl implements _NoticeSettingModel {
  const _$NoticeSettingModelImpl({required final Map<String, bool> topics})
      : _topics = topics;

  final Map<String, bool> _topics;
  @override
  Map<String, bool> get topics {
    if (_topics is EqualUnmodifiableMapView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topics);
  }

  @override
  String toString() {
    return 'NoticeSettingModel(topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoticeSettingModelImpl &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  /// Create a copy of NoticeSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoticeSettingModelImplCopyWith<_$NoticeSettingModelImpl> get copyWith =>
      __$$NoticeSettingModelImplCopyWithImpl<_$NoticeSettingModelImpl>(
          this, _$identity);
}

abstract class _NoticeSettingModel implements NoticeSettingModel {
  const factory _NoticeSettingModel({required final Map<String, bool> topics}) =
      _$NoticeSettingModelImpl;

  @override
  Map<String, bool> get topics;

  /// Create a copy of NoticeSettingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoticeSettingModelImplCopyWith<_$NoticeSettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
