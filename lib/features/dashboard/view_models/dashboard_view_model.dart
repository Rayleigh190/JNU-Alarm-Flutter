import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/enums/campus_type.dart';
import 'package:jnu_alarm/features/dashboard/models/dashboard_model.dart';
import 'package:jnu_alarm/features/dashboard/models/weather_model.dart';
import 'package:jnu_alarm/features/dashboard/repos/dashboard_repo.dart';
import 'package:jnu_alarm/features/dashboard/view_models/wt_to_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardViewModel extends AsyncNotifier<DashboardInfoModel> {
  @override
  Future<DashboardInfoModel> build() async {
    final weather = WeatherModel(
      temperature: "-",
      imageUrl: wtToUrl('wt99'),
      campusName: "--캠",
      naverUrl:
          "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=%EA%B4%91%EC%A3%BC+%EB%B6%81%EA%B5%AC+%EC%9A%A9%EB%B4%89%EB%8F%99+%EB%82%A0%EC%94%A8",
    );
    return DashboardInfoModel(weather: weather);
  }

  Future<void> refresh() async {
    final weather = await fetchWeather();
    state = AsyncValue.data(DashboardInfoModel(weather: weather));
  }

  Future<WeatherModel> fetchWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final campusType = CampusType.getByString(
        prefs.getString('weather_campus') ?? CampusType.yongbong.name);
    final weatherResponse = await DashboardRepo.fetchWeather(campusType);
    return WeatherModel(
      imageUrl: wtToUrl(weatherResponse.weatherType),
      temperature: weatherResponse.temperature,
      campusName: campusType.displayName,
      naverUrl: weatherResponse.naverUrl,
    );
  }

  Future<void> setWeatherCampus(CampusType campus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('weather_campus', campus.name);
    refresh();
  }
}

final dashboardProvider =
    AsyncNotifierProvider<DashboardViewModel, DashboardInfoModel>(
        () => DashboardViewModel());
