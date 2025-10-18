import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/gaps.dart';

class PopularNoticeItem extends StatelessWidget {
  final String rank;
  final String body;
  final int? hits;
  final String? trend;

  const PopularNoticeItem({
    super.key,
    required this.rank,
    required this.body,
    this.hits,
    this.trend,
  });

  String convertTrendToEmoji(String trend) {
    switch (trend) {
      case "상승":
        return "🔺";
      case "하강":
        return "🔻";
      default:
        return "➖";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              rank,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Gaps.h10,
        Expanded(
          child: Text(
            body,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white70 : Colors.black,
            ),
          ),
        ),
        Gaps.h5,
        if (hits != null)
          Text(
            "+$hits",
            style: const TextStyle(
              fontSize: 10,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (trend != null)
          Text(
            convertTrendToEmoji(trend!),
            style: const TextStyle(fontSize: 12),
          )
      ],
    );
  }
}
