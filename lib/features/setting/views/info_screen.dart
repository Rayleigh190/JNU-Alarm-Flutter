import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = "/info";

  const InfoScreen({super.key});

  void _openWebView(BuildContext context, String title, String link) {
    Navigator.pushNamed(
      context,
      WebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: title,
        link: link,
      ),
    );
  }

  int _onTapVersion(int count) => count + 1;

  @override
  Widget build(BuildContext context) {
    int devModeActiveCount = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("정보"),
      ),
      body: SettingsList(
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
                  devModeActiveCount = _onTapVersion(devModeActiveCount);
                  print(devModeActiveCount);
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
