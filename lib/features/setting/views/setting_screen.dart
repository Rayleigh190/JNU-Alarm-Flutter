import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          SettingsSection(
            title: const Text('일반'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.language),
                title: const Text('기본 알림'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('홍보/광고'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('대학'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('학사 알림'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('장학 알림'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('단과대 알림'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('학과 알림'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('전문대학원 알림'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
