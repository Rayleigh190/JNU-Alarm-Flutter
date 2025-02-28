import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_model.freezed.dart';
part 'map_model.g.dart';

@freezed
class MapResponseModel with _$MapResponseModel {
  const factory MapResponseModel({
    required List<TopCategoryModel> top_categories,
    String? error,
  }) = _MapResponseModel;

  factory MapResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MapResponseModelFromJson(json);
}

@freezed
class TopCategoryModel with _$TopCategoryModel {
  const factory TopCategoryModel({
    required String name,
    required String url,
  }) = _TopCategoryModel;

  factory TopCategoryModel.fromJson(Map<String, Object?> json) =>
      _$TopCategoryModelFromJson(json);
}

@freezed
class PlacesResponseModel with _$PlacesResponseModel {
  const factory PlacesResponseModel({
    required List<PlaceModel> data,
  }) = _PlacesResponseModel;

  factory PlacesResponseModel.fromJson(Map<String, Object?> json) =>
      _$PlacesResponseModelFromJson(json);
}

@freezed
class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    required String title,
    required String image_url,
    required String description,
    required String tag,
    required String emoji,
    required String category_name,
    required CoordModel coord,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, Object?> json) =>
      _$PlaceModelFromJson(json);
}

@freezed
class CoordModel with _$CoordModel {
  const factory CoordModel({
    required double lat,
    required double lng,
  }) = _CoordModel;

  factory CoordModel.fromJson(Map<String, Object?> json) =>
      _$CoordModelFromJson(json);
}
