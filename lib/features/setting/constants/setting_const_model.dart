import 'package:flutter/material.dart';

class SwitchTile {
  final Widget? icon;
  final String title;
  final String topic;
  final bool enabled;

  const SwitchTile({
    this.icon,
    required this.title,
    required this.topic,
    this.enabled = true,
  });
}

class NavigationTile {
  final Widget icon;
  final String title;
  final String to;

  const NavigationTile({
    required this.icon,
    required this.title,
    required this.to,
  });
}

class SettingSection {
  final String title;
  final List<dynamic> tiles;

  const SettingSection({
    required this.title,
    required this.tiles,
  });
}
