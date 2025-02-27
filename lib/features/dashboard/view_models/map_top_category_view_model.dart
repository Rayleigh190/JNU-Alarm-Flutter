import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/dashboard/models/map_model.dart';
import 'package:jnu_alarm/features/dashboard/repos/map_repo.dart';

class MapTopCategoryViewModel extends AsyncNotifier<List<TopCategoryModel>> {
  @override
  Future<List<TopCategoryModel>> build() async {
    final a = await MapRepository.fetchMap();
    return a?.top_categories ?? [];
  }
}

final topCategoryProvider =
    AsyncNotifierProvider<MapTopCategoryViewModel, List<TopCategoryModel>>(() {
  return MapTopCategoryViewModel();
});
