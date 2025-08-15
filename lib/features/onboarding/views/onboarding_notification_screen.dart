import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/onboarding/views/init_screen.dart';
import 'package:jnu_alarm/features/onboarding/views/onboarding_ad_screen.dart';

class OnboardingNotificationScreen extends ConsumerWidget {
  static const routeName = "onboarding_notification";
  const OnboardingNotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 18,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            const Text(
              "알림 권한을 허용해 주셔야",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            const Text(
              "알림을 받을 수 있어요!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Gaps.v56,
            const Text(
              "🔔",
              style: TextStyle(fontSize: 100),
            ),
            const Spacer(),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseMessaging.instance.requestPermission();
                    if (context.mounted) {
                      final routeName = Platform.isAndroid
                          ? InitScreen.routeName
                          : OnboardingAdScreen.routeName;
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(routeName, (route) => false);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "다음",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF323430),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
