import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/secrets.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class NoticeRepository {
  static Future<NoticeResponseModel?> fetchNotices(
      List<String> topics, DateTime date) async {
    final url = Uri.parse(
        '$baseUrl/alarm/notification/?topics=${topics.join(",")}&date=$date');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return NoticeResponseModel.fromJson(
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
