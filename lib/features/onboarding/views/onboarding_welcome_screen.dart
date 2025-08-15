import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/onboarding/views/onboarding_notification_screen.dart';

class OnboardingWelcomeScreen extends ConsumerWidget {
  static const routeName = "onboarding_welcome";
  const OnboardingWelcomeScreen({super.key});

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
              "새로운 공지사항이 올라오면",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            const Text(
              "알림으로 알려줄게요!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Gaps.v40,
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Image.asset('assets/images/img_push_notification.png'),
            ),
            Gaps.v20,
            const Text(
              "🙋",
              style: TextStyle(fontSize: 100),
            ),
            const Spacer(),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        OnboardingNotificationScreen.routeName,
                        (route) => false);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "시작하기",
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
