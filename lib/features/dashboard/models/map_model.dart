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
