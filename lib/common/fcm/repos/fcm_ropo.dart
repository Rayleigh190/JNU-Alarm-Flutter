import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
        _showLocalNotification(title, body, data['link']);
      }
    });
  }

  void _showLocalNotification(String title, String body, String link) async {
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
      payload: "$title $link",
    );
  }

  Future<void> handleAndroidForegroundMessage(
      void Function(String title, String link) onMessageReceived) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        final data = details.payload?.split(" ");
        onMessageReceived(data!.first, data.last);
      },
    );
  }

  void handleOnMessageOpenedFromBackground(
      void Function(String title, String link) onMessageReceived) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
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
