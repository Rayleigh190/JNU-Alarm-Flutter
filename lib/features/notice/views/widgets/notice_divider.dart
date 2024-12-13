import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class NoticeDivider extends StatelessWidget {
  const NoticeDivider({super.key, required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF282828) : const Color(0xFFEDECE8),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
              vertical: Sizes.size5,
            ),
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: Sizes.size12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
