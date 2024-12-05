class SwitchTile {
  final String title;
  final String topic;

  const SwitchTile({
    required this.title,
    required this.topic,
  });
}

class NavigationTile {
  final String title;

  const NavigationTile({
    required this.title,
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
