import 'package:flutter/material.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn({
    super.key,
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: Sizes.size36,
        width: Sizes.size36,
        child: Icon(
          icon,
          color: (currentIndex == index)
              ? const Color(0xFF323430)
              : const Color(0xFF888887),
        ),
      ),
    );
  }
}
