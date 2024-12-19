// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopBannerResponseModelImpl _$$TopBannerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopBannerResponseModelImpl(
      success: json['success'] as bool,
      response: (json['response'] as List<dynamic>)
          .map((e) => TopBannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$TopBannerResponseModelImplToJson(
        _$TopBannerResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
    };

_$TopBannerModelImpl _$$TopBannerModelImplFromJson(Map<String, dynamic> json) =>
    _$TopBannerModelImpl(
      name: json['name'] as String,
      image_url: json['image_url'] as String,
      direction_url: json['direction_url'] as String,
      expiry_date: DateTime.parse(json['expiry_date'] as String),
      is_external_browser: json['is_external_browser'] as bool,
      is_available: json['is_available'] as bool,
    );

Map<String, dynamic> _$$TopBannerModelImplToJson(
        _$TopBannerModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.image_url,
      'direction_url': instance.direction_url,
      'expiry_date': instance.expiry_date.toIso8601String(),
      'is_external_browser': instance.is_external_browser,
      'is_available': instance.is_available,
    };
