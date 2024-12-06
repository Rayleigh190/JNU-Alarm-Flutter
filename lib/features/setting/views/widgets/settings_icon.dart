import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  final Color color;
  final IconData icons;

  const SettingsIcon({super.key, required this.color, required this.icons});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Icon(
          icons,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
