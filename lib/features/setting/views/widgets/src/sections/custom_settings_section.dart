import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/views/widgets/src/sections/abstract_settings_section.dart';

class CustomSettingsSection extends AbstractSettingsSection {
  const CustomSettingsSection({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
