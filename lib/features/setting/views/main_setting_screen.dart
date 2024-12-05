import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/constants/main_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';

class MainSettingScreen extends ConsumerWidget {
  const MainSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(noticeSettingProvider);
    final settingsNotifier = ref.read(noticeSettingProvider.notifier);

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
        sections: mainSettingSectionGroup.map((section) {
          return SettingsSection(
            title: Text(section.title),
            tiles: section.tiles.map((tile) {
              if (tile is SwitchTile) {
                return SettingsTile.switchTile(
                  title: Text(tile.title),
                  initialValue: settings.topics[tile.topic] ?? false,
                  onToggle: (value) {
                    settingsNotifier.toggleTopic(tile.topic, value);
                  },
                );
              } else if (tile is NavigationTile) {
                return SettingsTile.navigation(
                  title: Text(tile.title),
                );
              }
              throw Exception("Unsupported tile type: ${tile.runtimeType}");
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
