import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/secrets.dart';

class InitRepository {
  static Future<Map<String, dynamic>> fetchFcmInfo() async {
    final token = await FirebaseMessaging.instance.getToken();
    final url = Uri.parse('$baseUrl/user/fcm-info/?token=$token');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else if (response.statusCode >= 500) {
      throw const APIException.internal("서버와 연결이 끊겼습니다.");
    } else {
      return {};
    }
  }
}
