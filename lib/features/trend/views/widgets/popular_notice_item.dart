import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/gaps.dart';

class PopularNoticeItem extends StatelessWidget {
  final String rank;
  final String body;
  final int hits;

  const PopularNoticeItem({
    super.key,
    required this.rank,
    required this.body,
    required this.hits,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Row(
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              rank,
              style: const TextStyle(
                fontSize: 11,
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
              fontSize: 14,
              color: isDark ? Colors.white70 : Colors.black,
            ),
          ),
        ),
        Gaps.h5,
        Text(
          "+$hits",
          style: const TextStyle(
            fontSize: 10,
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
