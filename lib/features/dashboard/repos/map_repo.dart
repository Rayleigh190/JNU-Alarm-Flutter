import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/network/network_connection_check.dart';
import 'package:jnu_alarm/features/dashboard/models/map_model.dart';

class MapRepository {
  static Future<MapResponseModel?> fetchMap() async {
    if (!await isNetworkConnected()) return null;
    final url = Uri.parse(
        'https://raw.githubusercontent.com/Rayleigh190/JNU-Alarm-Map/refs/heads/main/map.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MapResponseModel.fromJson(
        json.decode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
    return null;
  }

  static Future<PlacesResponseModel?> fetchPlaces(String urlStr) async {
    if (!await isNetworkConnected()) return null;
    final url = Uri.parse(urlStr);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return PlacesResponseModel.fromJson(
        json.decode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
    return null;
  }
}
