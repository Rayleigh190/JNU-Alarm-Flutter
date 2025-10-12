import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/secrets.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_model.dart';

class TrendRepo {
  static Future<PopularNoticeResponseModel?> fetchPopularNotices() async {
    final url = Uri.parse('$baseUrl/alarm/notification/popular/');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return PopularNoticeResponseModel.fromJson(
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
