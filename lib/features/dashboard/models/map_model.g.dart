// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapResponseModelImpl _$$MapResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MapResponseModelImpl(
      top_categories: (json['top_categories'] as List<dynamic>)
          .map((e) => TopCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$MapResponseModelImplToJson(
        _$MapResponseModelImpl instance) =>
    <String, dynamic>{
      'top_categories': instance.top_categories,
      'error': instance.error,
    };

_$TopCategoryModelImpl _$$TopCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopCategoryModelImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$TopCategoryModelImplToJson(
        _$TopCategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
