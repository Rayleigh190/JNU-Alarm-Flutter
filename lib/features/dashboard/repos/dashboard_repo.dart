import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:jnu_alarm/common/enums/campus_type.dart';

import 'package:jnu_alarm/features/dashboard/models/weather_model.dart';

class DashboardRepo {
  static Future<WeatherResponseModel> fetchWeather(CampusType campus) async {
    String url;

    switch (campus) {
      case CampusType.hwasun:
        url =
            "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=%ED%99%94%EC%88%9C%EA%B5%B0+%ED%99%94%EC%88%9C%EC%9D%8D+%EB%82%A0%EC%94%A8";
        break;
      case CampusType.yeosu:
        url =
            "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=%EC%97%AC%EC%88%98%EC%8B%9C+%EB%AF%B8%ED%8F%89%EB%8F%99+%EB%82%A0%EC%94%A8";
        break;
      default: // yongbong
        url =
            'https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=%EA%B4%91%EC%A3%BC+%EB%B6%81%EA%B5%AC+%EC%9A%A9%EB%B4%89%EB%8F%99+%EB%82%A0%EC%94%A8';
        break;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      var temperatureString =
          document.getElementsByClassName('temperature_text').first.text;
      var weatherTypeClass = document
          .getElementsByClassName('weather_main')
          .first
          .children
          .first
          .className;

      RegExp wheatherTypeRegExp = RegExp(r'_([^_]+)$'); // 마지막 _ 뒤의 문자열 추출
      Match? weatherType = wheatherTypeRegExp.firstMatch(weatherTypeClass);

      RegExp temperatureRegExp = RegExp(r'(-?\d+\.?\d*)');
      Match? temperature = temperatureRegExp.firstMatch(temperatureString);

      if (temperature != null && weatherType != null) {
        return WeatherResponseModel(
          weatherType: weatherType[1] ?? "wt99",
          temperature: temperature[0] ?? "99",
          naverUrl: url,
        );
      }
    }
    return WeatherResponseModel(
      weatherType: "wt99",
      temperature: "99",
      naverUrl: url,
    );
  }
}
