import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_model.freezed.dart';
part 'notice_model.g.dart';

@freezed
class NoticeResponseModel with _$NoticeResponseModel {
  const factory NoticeResponseModel({
    required bool success,
    required List<NoticeModel> response,
    String? error,
  }) = _NoticeResponseModel;

  factory NoticeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeResponseModelFromJson(json);
}

@freezed
class NoticeModel with _$NoticeModel {
  const factory NoticeModel({
    required int id,
    required String title,
    required String body,
    required String link,
    required DateTime created_at,
    @Default(0) int is_read,
    @Default(0) int is_bookmarked,
  }) = _NoticeModel;

  factory NoticeModel.fromJson(Map<String, Object?> json) =>
      _$NoticeModelFromJson(json);
}
