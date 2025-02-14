import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/enums/campus_type.dart';
import 'package:jnu_alarm/features/dashboard/models/weather_model.dart';
import 'package:jnu_alarm/features/dashboard/repos/dashboard_repo.dart';
import 'package:jnu_alarm/features/dashboard/view_models/wt_to_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherNotifier extends AsyncNotifier<WeatherModel> {
  @override
  Future<WeatherModel> build() async {
    return fetchWeather();
  }

  Future<WeatherModel> fetchWeather() async {
    state = const AsyncValue.loading();
    final prefs = await SharedPreferences.getInstance();
    final campusType = CampusType.getByString(
        prefs.getString('weather_campus') ?? CampusType.yongbong.name);
    final weatherResponse = await DashboardRepo.fetchWeather(campusType);
    return WeatherModel(
      imageUrl: wtToUrl(weatherResponse.weatherType),
      temperature: weatherResponse.temperature,
      campusName: campusType.displayName,
    );
  }

  Future<void> refresh() async {
    state = AsyncValue.data(await fetchWeather());
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherModel>(
    () => WeatherNotifier());
