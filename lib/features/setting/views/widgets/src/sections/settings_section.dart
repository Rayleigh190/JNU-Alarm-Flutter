import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/sections/abstract_settings_section.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/sections/platforms/android_settings_section.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/sections/platforms/ios_settings_section.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/sections/platforms/web_settings_section.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/tiles/abstract_settings_tile.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/utils/platform_utils.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/utils/settings_theme.dart';

class SettingsSection extends AbstractSettingsSection {
  const SettingsSection({
    required this.tiles,
    this.margin,
    this.title,
    super.key,
  });

  final List<AbstractSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final theme = SettingsTheme.of(context);

    switch (theme.platform) {
      case DevicePlatform.android:
      case DevicePlatform.fuchsia:
      case DevicePlatform.linux:
        return AndroidSettingsSection(
          title: title,
          tiles: tiles,
          margin: margin,
        );
      case DevicePlatform.iOS:
      case DevicePlatform.macOS:
      case DevicePlatform.windows:
        return IOSSettingsSection(
          title: title,
          tiles: tiles,
          margin: margin,
        );
      case DevicePlatform.web:
        return WebSettingsSection(
          title: title,
          tiles: tiles,
          margin: margin,
        );
      case DevicePlatform.device:
        throw Exception(
          'You can\'t use the DevicePlatform.device in this context. '
          'Incorrect platform: SettingsSection.build',
        );
    }
  }
}
