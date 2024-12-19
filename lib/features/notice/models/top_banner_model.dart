import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_banner_model.freezed.dart';
part 'top_banner_model.g.dart';

@freezed
class TopBannerResponseModel with _$TopBannerResponseModel {
  const factory TopBannerResponseModel({
    required bool success,
    required List<TopBannerModel> response,
    String? error,
  }) = _TopBannerResponseModel;

  factory TopBannerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopBannerResponseModelFromJson(json);
}

@freezed
class TopBannerModel with _$TopBannerModel {
  const factory TopBannerModel({
    required String name,
    required String image_url,
    required String direction_url,
    required DateTime expiry_date,
    required bool is_external_browser,
    required bool is_available,
  }) = _TopBannerModel;

  factory TopBannerModel.fromJson(Map<String, Object?> json) =>
      _$TopBannerModelFromJson(json);
}
