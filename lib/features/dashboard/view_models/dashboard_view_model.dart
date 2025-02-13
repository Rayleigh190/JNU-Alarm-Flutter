import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/dashboard/models/dashboard_model.dart';
import 'package:jnu_alarm/features/dashboard/view_models/weather_notifier.dart';

class DashboardViewModel extends AsyncNotifier<DashboardInfoModel> {
  @override
  Future<DashboardInfoModel> build() async {
    final weather = await ref.watch(weatherProvider.future);
    return DashboardInfoModel(weather: weather);
  }

  Future<void> refresh() async {
    ref.watch(weatherProvider.notifier).refresh();
  }
}

final dashboardProvider =
    AsyncNotifierProvider<DashboardViewModel, DashboardInfoModel>(
        () => DashboardViewModel());
