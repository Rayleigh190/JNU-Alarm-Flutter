import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jnu_alarm/common/fcm/widgets/foreground_notification.dart';

class FcmRepository {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // FCM 초기화 및 권한 요청
  Future<void> initialize() async {
    NotificationSettings permission = await _messaging.requestPermission();

    if (permission.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("FCM 권한 승인됨.");
    } else {
      debugPrint("FCM 권한 거부됨.");
    }

    setupNotificationChannels();
  }

  void setupNotificationChannels() async {
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

  // Foreground 메시지 처리
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

  // 백그라운드 메시지 핸들링
  @pragma('vm:entry-point')
  Future<void> setupBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    debugPrint('백그라운드 메시지 수신: ${message.notification?.title}');
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}

void showCustomNotification(BuildContext context, String title, String body) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 60,
      left: 14,
      right: 14,
      child: ForegroundNotification(
        title: title,
        body: body,
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 4)).then((_) {
    overlayEntry.remove();
  });
}
