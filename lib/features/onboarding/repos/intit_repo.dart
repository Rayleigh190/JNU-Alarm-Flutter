import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:jnu_alarm/common/secrets.dart';

class InitRepository {
  static Future<Map<String, dynamic>> fetchFcmInfo() async {
    final token = await FirebaseMessaging.instance.getToken();
    final url = Uri.parse('$baseUrl/user/fcm-info/?token=$token');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Error();
  }
}
