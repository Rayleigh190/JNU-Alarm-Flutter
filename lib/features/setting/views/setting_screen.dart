import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

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
        sections: [
          for (var section in NoticeSettingViewModel.groupedTopics.entries)
            SettingsSection(
              title: Text(section.key),
              tiles: [
                for (var topicEntry in section.value)
                  SettingsTile.switchTile(
                    title: Text(topicEntry.values.first), // 한글명
                    initialValue:
                        settings.topics[topicEntry.keys.first] ?? false,
                    onToggle: (value) {
                      settingsNotifier.toggleTopic(
                          topicEntry.keys.first, value);
                    },
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
