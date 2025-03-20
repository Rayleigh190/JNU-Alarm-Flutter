import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/enums/campus_type.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/secrets.dart';

import 'package:jnu_alarm/features/dashboard/models/weather_model.dart';

class DashboardRepo {
  static Future<WeatherResponseModel?> fetchWeather(CampusType campus) async {
    final url = Uri.parse('$baseUrl/dashboard/weather?campus=${campus.name}');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return WeatherResponseModel.fromJson(
          json.decode(
            utf8.decode(response.bodyBytes),
          ),
        );
      } else if (response.statusCode >= 500) {
        throw const ApiInternalServerException("서버와 연결이 끊겼습니다.");
      }
    } on SocketException catch (e) {
      debugPrint(e.message);
    }
    return null;
  }
}
