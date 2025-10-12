import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_notice_model.freezed.dart';
part 'popular_notice_model.g.dart';

@freezed
class PopularNoticeResponseModel with _$PopularNoticeResponseModel {
  const factory PopularNoticeResponseModel({
    required bool success,
    required PopularNoticeListModel response,
    String? error,
  }) = _PopularNoticeResponseModel;

  factory PopularNoticeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularNoticeResponseModelFromJson(json);
}

@freezed
class PopularNoticeListModel with _$PopularNoticeListModel {
  const factory PopularNoticeListModel({
    required List<PopularNoticeModel> daily_top,
    required List<PopularNoticeModel> weekly_top,
  }) = _PopularNoticeListModel;

  factory PopularNoticeListModel.fromJson(Map<String, Object?> json) =>
      _$PopularNoticeListModelFromJson(json);
}

@freezed
class PopularNoticeModel with _$PopularNoticeModel {
  const factory PopularNoticeModel({
    required int id,
    required String title,
    required String body,
    required String link,
    int? daily_hits,
    int? weekly_hits,
  }) = _PopularNoticeModel;

  factory PopularNoticeModel.fromJson(Map<String, Object?> json) =>
      _$PopularNoticeModelFromJson(json);
}
