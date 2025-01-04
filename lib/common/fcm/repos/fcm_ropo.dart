import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jnu_alarm/features/main/models/fcm_message_model.dart';

class FcmRepository {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    NotificationSettings permission = await _messaging.requestPermission();

    if (permission.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("FCM 권한 승인됨.");
    } else {
      debugPrint("FCM 권한 거부됨.");
    }

    if (Platform.isAndroid) {
      _setupForegroundMessage();
      _setupNotificationChannels();
    } else {
      _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
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

  void _setupForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      final data = message.data;

      if (notification != null) {
        final title = notification.title ?? "No title";
        final body = notification.body ?? "No body";
        _showLocalNotification(
            title, body, data['link'], int.parse(data['id']));
      }
    });
  }

  void _showLocalNotification(
      String title, String body, String link, int id) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      '100',
      '모든 알림',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: "$title@$link@$body@$id",
    );
  }

  Future<void> handleAndroidForegroundMessage(
      void Function(String title, String link, String body, int id)
          onMessageReceived) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        final data = details.payload?.split("@");
        onMessageReceived(data![0], data[1], data[2], int.parse(data[3]));
      },
    );
  }

  Future<void> handleOnMessageOpenedFromBackgroundAndTerminated(
      void Function(FcmMessageModel message) onMessageReceived) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      onMessageReceived(_parseMessage(initialMessage));
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      onMessageReceived(_parseMessage(message));
    });
  }

  FcmMessageModel _parseMessage(RemoteMessage message) {
    final title = message.data['title'];
    final link = message.data['link'];
    final body = message.notification?.body ?? "";
    final id = int.parse(message.data['id']);
    return FcmMessageModel(title, link, body, id);
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
