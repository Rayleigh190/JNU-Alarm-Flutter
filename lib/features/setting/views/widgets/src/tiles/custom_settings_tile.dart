import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/tiles/abstract_settings_tile.dart';

class CustomSettingsTile extends AbstractSettingsTile {
  const CustomSettingsTile({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
