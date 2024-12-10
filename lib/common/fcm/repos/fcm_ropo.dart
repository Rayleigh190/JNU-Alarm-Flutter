import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmRepository {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings permission = await _messaging.requestPermission();

    if (permission.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("FCM 권한 승인됨.");
    } else {
      debugPrint("FCM 권한 거부됨.");
    }

    _setupNotificationChannels();
  }

  void _setupNotificationChannels() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      '100',
      '모든 알림',
      importance: Importance.high,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    final AndroidFlutterLocalNotificationsPlugin androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!;
    await androidImplementation.createNotificationChannel(channel);
  }

  void handleForegroundMessage(
      void Function(String title, String body) onMessageReceived) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground 메시지 수신: ${message.notification?.title}');
      final notification = message.notification;
      if (notification != null) {
        onMessageReceived(
            notification.title ?? "No Title", notification.body ?? "No Body");
      }
    });
  }

  void handleOnMessageOpenedFromBackground(
      void Function(String title, String link) onMessageReceived) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification opened: ${message.data}');
      final title = message.data['title'];
      final link = message.data['link'];
      if (title != null && link != null) {
        onMessageReceived(title, link);
      }
    });
  }

  Future<void> handleOnMessageOpendFromTerminated(
      void Function(String title, String link) onMessageReceived) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      final title = initialMessage.data['title'];
      final link = initialMessage.data['link'];
      onMessageReceived(title, link);
    }
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
