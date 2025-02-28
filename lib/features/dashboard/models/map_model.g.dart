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

_$PlacesResponseModelImpl _$$PlacesResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlacesResponseModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => PlaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlacesResponseModelImplToJson(
        _$PlacesResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PlaceModelImpl _$$PlaceModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaceModelImpl(
      title: json['title'] as String,
      image_url: json['image_url'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      emoji: json['emoji'] as String,
      category_name: json['category_name'] as String,
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceModelImplToJson(_$PlaceModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image_url': instance.image_url,
      'description': instance.description,
      'tag': instance.tag,
      'emoji': instance.emoji,
      'category_name': instance.category_name,
      'coord': instance.coord,
    };

_$CoordModelImpl _$$CoordModelImplFromJson(Map<String, dynamic> json) =>
    _$CoordModelImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoordModelImplToJson(_$CoordModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
