import 'package:flutter/cupertino.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/widgets/loading_dialog.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/models/notice_setting_model.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';

CupertinoScrollbar getSettingScreenBody(
    NoticeSettingModel settings,
    BuildContext context,
    NoticeSettingViewModel settingsNotifier,
    List<SettingSection> settingSectionGroup) {
  return CupertinoScrollbar(
    child: SettingsList(
      platform: DevicePlatform.iOS,
      sections: settingSectionGroup.map((section) {
        return SettingsSection(
          title: Text(section.title),
          tiles: section.tiles.map((tile) {
            if (tile is SwitchTile) {
              return SettingsTile.switchTile(
                enabled: tile.enabled,
                title: Text(tile.title),
                initialValue: settings.topics[tile.topic] ?? false,
                onToggle: (value) async {
                  LoadingDialogBuilder(context).showLoadingDialog(
                    value ? "${tile.title} 구독 중.." : "${tile.title} 구독 취소 중..",
                  );
                  try {
                    await settingsNotifier.toggleTopic(tile.topic, value);
                  } on NetworkConnectivityException catch (e) {
                    if (context.mounted) {
                      await showErrorAlert(context, e.message);
                    }
                  } finally {
                    if (context.mounted) {
                      LoadingDialogBuilder(context).hideLoadingDialog();
                    }
                  }
                },
              );
            } else if (tile is NavigationTile) {
              return SettingsTile.navigation(
                leading: tile.icon,
                title: Text(tile.title),
                onPressed: (context) {
                  Navigator.of(context).pushNamed(tile.to);
                },
              );
            }
            throw Exception("Unsupported tile type: ${tile.runtimeType}");
          }).toList(),
        );
      }).toList(),
    ),
  );
}
