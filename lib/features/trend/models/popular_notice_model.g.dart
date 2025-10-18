// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopularNoticeResponseModelImpl _$$PopularNoticeResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularNoticeResponseModelImpl(
      success: json['success'] as bool,
      response: PopularNoticeListModel.fromJson(
          json['response'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$PopularNoticeResponseModelImplToJson(
        _$PopularNoticeResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
    };

_$PopularNoticeListModelImpl _$$PopularNoticeListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularNoticeListModelImpl(
      daily_top: (json['daily_top'] as List<dynamic>)
          .map((e) => PopularNoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekly_top: (json['weekly_top'] as List<dynamic>)
          .map((e) => PopularNoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PopularNoticeListModelImplToJson(
        _$PopularNoticeListModelImpl instance) =>
    <String, dynamic>{
      'daily_top': instance.daily_top,
      'weekly_top': instance.weekly_top,
    };

_$PopularNoticeModelImpl _$$PopularNoticeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularNoticeModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      link: json['link'] as String,
      daily_hits: (json['daily_hits'] as num?)?.toInt(),
      trend: json['trend'] as String?,
      weekly_hits: (json['weekly_hits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PopularNoticeModelImplToJson(
        _$PopularNoticeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'link': instance.link,
      'daily_hits': instance.daily_hits,
      'trend': instance.trend,
      'weekly_hits': instance.weekly_hits,
    };
