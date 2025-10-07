import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

Future<void> build34Update() async {
  debugPrint("build34Update 실행");
  var uuid = const Uuid().v4();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('uuid', uuid);
  debugPrint("UUID 저장 : $uuid");
}
