import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/secrets.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class NoticeRepository {
  static Future<NoticeResponseModel> fetchNotices(
      List<String> topics, DateTime date) async {
    final url = Uri.parse(
        '$baseUrl/alarm/notification/?topics=${topics.join(",")}&date=$date');
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
