import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/common/widgets/loading_dialog.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/view_models/setting_section_view_model.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class MainSettingScreen extends ConsumerStatefulWidget {
  const MainSettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainSettingScreenState();
}

class _MainSettingScreenState extends ConsumerState<MainSettingScreen>
    with AutomaticKeepAliveClientMixin {
  Future<void> openExBrowser(String link) async {
    final url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final settings = ref.watch(mainNoticeSettingProvider);
    final settingsNotifier = ref.read(mainNoticeSettingProvider.notifier);
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
      ),
      body: CupertinoScrollbar(
        child: SettingsList(
          contentPadding: EdgeInsets.symmetric(vertical: appBarHeight),
          platform: DevicePlatform.iOS,
          sections: ref.watch(settingSectionProvider).map((section) {
            return SettingsSection(
              title: Text(section.title),
              tiles: section.tiles.map((tile) {
                if (tile is SwitchTile) {
                  return SettingsTile.switchTile(
                    enabled: tile.enabled,
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
                } else if (tile is WebViewTile) {
                  return SettingsTile.navigation(
                    leading: tile.icon,
                    title: Text(tile.title),
                    onPressed: (context) => Navigator.pushNamed(
                      context,
                      WebViewScreen.routeName,
                      arguments: WebViewScreenArgs(
                        title: tile.title,
                        link: tile.link,
                      ),
                    ),
                  );
                } else if (tile is ExBrowserTile) {
                  return SettingsTile.navigation(
                    leading: tile.icon,
                    title: Text(tile.title),
                    onPressed: (context) => openExBrowser(tile.link),
                  );
                }
                throw Exception("Unsupported tile type: ${tile.runtimeType}");
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
