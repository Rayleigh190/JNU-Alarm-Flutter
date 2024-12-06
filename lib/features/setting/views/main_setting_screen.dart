import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/error/global_error_handler.dart';
import 'package:jnu_alarm/common/widgets/loading_dialog.dart';
import 'package:jnu_alarm/features/setting/constants/main_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';

class MainSettingScreen extends ConsumerStatefulWidget {
  const MainSettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainSettingScreenState();
}

class _MainSettingScreenState extends ConsumerState<MainSettingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final settings = ref.watch(noticeSettingProvider);
    final settingsNotifier = ref.read(noticeSettingProvider.notifier);
    final double appBarHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          CupertinoButton(
            child: const Text("Get token"),
            onPressed: () async {
              debugPrint(await FirebaseMessaging.instance.getToken());
            },
          )
        ],
      ),
      body: SettingsList(
        contentPadding: EdgeInsets.symmetric(vertical: appBarHeight),
        platform: DevicePlatform.iOS,
        sections: mainSettingSectionGroup.map((section) {
          return SettingsSection(
            title: Text(section.title),
            tiles: section.tiles.map((tile) {
              if (tile is SwitchTile) {
                return SettingsTile.switchTile(
                  title: Text(tile.title),
                  leading: tile.icon,
                  initialValue: settings.topics[tile.topic] ?? false,
                  onToggle: (value) async {
                    LoadingDialogBuilder(context).showLoadingDialog(
                      value
                          ? "${tile.title} 구독 중.."
                          : "${tile.title} 구독 취소 중..",
                    );
                    try {
                      await settingsNotifier.toggleTopic(tile.topic, value);
                    } catch (e, stackTrace) {
                      GlobalErrorHandler().handle(e, stackTrace);
                    }
                    if (context.mounted) {
                      LoadingDialogBuilder(context).hideLoadingDialog();
                    }
                  },
                );
              } else if (tile is NavigationTile) {
                return SettingsTile.navigation(
                  leading: tile.icon,
                  title: Text(tile.title),
                  onPressed: (context) {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => tile.to,
                      ),
                    );
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

  @override
  bool get wantKeepAlive => true;
}
