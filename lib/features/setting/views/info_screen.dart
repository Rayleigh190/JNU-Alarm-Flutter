import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/secrets.dart';
import 'package:jnu_alarm/common/widgets/common_ad_web_view_screen.dart';
import 'package:jnu_alarm/common/widgets/notice_web_view_screen.dart';
import 'package:jnu_alarm/features/setting/view_models/setting_section_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

class InfoScreen extends ConsumerStatefulWidget {
  static const routeName = "/info";

  const InfoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoScreenState();
}

class _InfoScreenState extends ConsumerState<InfoScreen> {
  final TextEditingController _controller = TextEditingController();

  void _openWebView(BuildContext context, String title, String link) {
    Navigator.pushNamed(
      context,
      CommonAdWebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: title,
        link: link,
      ),
    );
  }

  Future<bool> postDevMode(String pw) async {
    final url = Uri.parse('$baseUrl/user/dev-mode/');
    final res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "password": _controller.text,
      }),
    );
    _controller.clear();
    return res.statusCode == 200;
  }

  void showResultDialog(BuildContext context, String title) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> submit(BuildContext context) async {
    if (await postDevMode(_controller.text)) {
      ref.read(settingSectionProvider.notifier).setDevMode(true);
      if (context.mounted) showResultDialog(context, "Success");
    } else {
      ref.read(settingSectionProvider.notifier).setDevMode(false);
      if (context.mounted) showResultDialog(context, "Fail");
    }
  }

  Future<void> _openDialog(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Activate dev mode"),
            content: TextField(
              controller: _controller,
              obscureText: true,
              autofocus: true,
              decoration: const InputDecoration(hintText: "Enter password"),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text("CANCLE"),
              ),
              TextButton(
                onPressed: () async {
                  if (_controller.text.isEmpty) return;
                  submit(context);
                },
                child: const Text("SUBMIT"),
              ),
            ],
          );
        });
  }

  int _onTapVersion(BuildContext context, int count) {
    if (count == 19) _openDialog(context);
    return count + 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int devModeActiveCount = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("정보"),
      ),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: const Text("버전"),
                trailing: FutureBuilder(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error");
                    }
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator.adaptive();
                    }
                    return Text(snapshot.data?.version ?? "");
                  },
                ),
                onPressed: (context) {
                  devModeActiveCount =
                      _onTapVersion(context, devModeActiveCount);
                },
              ),
              SettingsTile.navigation(
                title: const Text("업데이트 내역"),
                onPressed: (context) => _openWebView(context, "업데이트 내역",
                    "https://wackitlab.notion.site/39bb88d2c48249c9b29a40547d4b02fd"),
              ),
              SettingsTile.navigation(
                title: const Text("개인정보 처리방침"),
                onPressed: (context) => _openWebView(context, "개인정보 처리방침",
                    "https://wackitlab.notion.site/d6483585330d47cf8c3927c018d9075e"),
              ),
              SettingsTile.navigation(
                title: const Text("공식페이지"),
                onPressed: (context) => _openWebView(context, "공식페이지",
                    "https://wackitlab.notion.site/469d2c23433c48cca6965c3573058397"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
