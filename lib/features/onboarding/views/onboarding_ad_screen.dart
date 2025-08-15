import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/onboarding/views/init_screen.dart';

class OnboardingAdScreen extends ConsumerWidget {
  static const routeName = "onboarding_ad";
  const OnboardingAdScreen({super.key});

  Future<void> initAppTracking() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;

    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    debugPrint('IDFA: $uuid');
  }

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
              "전대알림은 맞춤 광고 제공\n권한으로 유지됩니다",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Gaps.v20,
            const Text(
              "🎁",
              style: TextStyle(fontSize: 100),
            ),
            Gaps.v20,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                " 잠시 뒤 요청드릴 권한은 오직 전대알림 앱의 원할한 사용과 애플 정책에 기반한 개인화 광고 제공 목적으로만 사용됩니다.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFF323430)),
              ),
            ),
            const Spacer(),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await initAppTracking();
                    if (context.mounted) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          InitScreen.routeName, (route) => false);
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
