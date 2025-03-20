// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseModelImpl _$$WeatherResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherResponseModelImpl(
      success: json['success'] as bool,
      response: WeatherModel.fromJson(json['response'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$WeatherResponseModelImplToJson(
        _$WeatherResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
    };

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      image_url: json['image_url'] as String,
      temperature: json['temperature'] as String,
      campus_name: json['campus_name'] as String,
      naver_url: json['naver_url'] as String,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'image_url': instance.image_url,
      'temperature': instance.temperature,
      'campus_name': instance.campus_name,
      'naver_url': instance.naver_url,
    };
