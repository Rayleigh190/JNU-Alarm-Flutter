import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/dashboard/models/map_model.dart';
import 'package:jnu_alarm/features/dashboard/repos/map_repo.dart';

class MapTopCategoryViewModel extends AsyncNotifier<List<TopCategoryModel>> {
  @override
  Future<List<TopCategoryModel>> build() async {
    final a = await MapRepository.fetchMap();
    return a?.top_categories ?? [];
  }

  Future<void> refreshCategory() async {
    final response = await MapRepository.fetchMap();
    state = AsyncValue.data(response?.top_categories ?? []);
  }
}

final topCategoryProvider =
    AsyncNotifierProvider<MapTopCategoryViewModel, List<TopCategoryModel>>(() {
  return MapTopCategoryViewModel();
});

class MapPlacesViewModel extends AsyncNotifier<List<PlaceModel>> {
  @override
  Future<List<PlaceModel>> build() async {
    return [];
  }

  Future<List<PlaceModel>> fetchPlaces(String urlStr) async {
    final response = await MapRepository.fetchPlaces(urlStr);
    return response?.data ?? [];
  }
}

final placesProvider =
    AsyncNotifierProvider<MapPlacesViewModel, List<PlaceModel>>(() {
  return MapPlacesViewModel();
});
