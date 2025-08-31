import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestSettingScreen extends ConsumerStatefulWidget {
  static const routeName = "/test";
  const TestSettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TestSettingScreenState();
}

class _TestSettingScreenState extends ConsumerState<TestSettingScreen> {
  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "테스트 설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoButton.filled(
              child: const Text("알림내역 동기화 날짜 5일 전으로"),
              onPressed: () async {
                try {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(
                      "last_notice_fetch_date",
                      DateTime.now()
                          .subtract(const Duration(days: 5))
                          .toString());
                  if (context.mounted) showSnackBar(context, "success");
                } catch (e) {
                  if (context.mounted) showSnackBar(context, e.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
