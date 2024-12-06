import 'package:flutter/material.dart';

class SwitchTile {
  final Widget icon;
  final String title;
  final String topic;

  const SwitchTile({
    required this.icon,
    required this.title,
    required this.topic,
  });
}

class NavigationTile {
  final Widget icon;
  final String title;
  final Widget to;

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
