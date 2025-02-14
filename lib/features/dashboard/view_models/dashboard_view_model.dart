import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/enums/campus_type.dart';
import 'package:jnu_alarm/features/dashboard/models/dashboard_model.dart';
import 'package:jnu_alarm/features/dashboard/view_models/weather_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardViewModel extends AsyncNotifier<DashboardInfoModel> {
  @override
  Future<DashboardInfoModel> build() async {
    final weather = await ref.watch(weatherProvider.future);
    return DashboardInfoModel(weather: weather);
  }

  Future<void> refresh() async {
    ref.watch(weatherProvider.notifier).refresh();
  }

  Future<void> setWeatherCampus(CampusType campus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('weather_campus', campus.name);
    ref.watch(weatherProvider.notifier).refresh();
  }
}

final dashboardProvider =
    AsyncNotifierProvider<DashboardViewModel, DashboardInfoModel>(
        () => DashboardViewModel());
