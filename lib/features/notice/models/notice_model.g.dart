// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeResponseModelImpl _$$NoticeResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NoticeResponseModelImpl(
      success: json['success'] as bool,
      response: (json['response'] as List<dynamic>)
          .map((e) => NoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$NoticeResponseModelImplToJson(
        _$NoticeResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
    };

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      link: json['link'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
      is_read: (json['is_read'] as num?)?.toInt() ?? 0,
      is_bookmarked: (json['is_bookmarked'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'link': instance.link,
      'created_at': instance.created_at.toIso8601String(),
      'is_read': instance.is_read,
      'is_bookmarked': instance.is_bookmarked,
    };
