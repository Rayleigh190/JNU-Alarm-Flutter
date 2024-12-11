import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class NoticeRepository {
  static const String baseUrl =
      "https://jnu-alarm.site/api/alarm/notification/?topics=";
  static const String today = "today";

  static Future<NoticeResponseModel> fetchNotices(List<String> topics) async {
    // final url = Uri.parse('$baseUrl/$today');
    final url = Uri.parse(baseUrl + topics.join(","));
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return NoticeResponseModel.fromJson(
        json.decode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
    throw Error();
  }
}
