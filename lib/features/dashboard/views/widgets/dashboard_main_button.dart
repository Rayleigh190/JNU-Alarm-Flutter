import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class DashboardMainButton extends StatelessWidget {
  const DashboardMainButton({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF282828) : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.size12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 1.0,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(Sizes.size10),
                  decoration: const BoxDecoration(
                    color: Color(0xffb8ed55),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Sizes.size56,
                      ),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: Sizes.size32,
                    color: const Color(0xff323531),
                  ),
                ),
                Gaps.v5,
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
