import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/constants/gaps.dart';

class NoticeTile extends StatelessWidget {
  const NoticeTile({
    super.key,
    required this.title,
    required this.body,
    required this.link,
    required this.createdAt,
  });

  final String title;
  final String body;
  final String link;
  final DateTime createdAt;

  String getFormattedTime(DateTime createdAt) {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays >= 1) {
      // 오늘 이전의 날짜
      return DateFormat('yyyy.MM.dd').format(createdAt);
    } else if (difference.inHours >= 1) {
      // 몇 시간 전
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes >= 1) {
      // 몇 분 전
      return '${difference.inMinutes}분 전';
    } else {
      // 몇 초 전
      return '${difference.inSeconds}초 전';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF282828) : Colors.white,
        borderRadius: BorderRadius.circular(Sizes.size9),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(5, 0, 0, 0),
            blurRadius: Sizes.size5,
            spreadRadius: Sizes.size1,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size16,
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Theme.of(context).primaryColor,
          ),
          Gaps.h12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      getFormattedTime(createdAt),
                      style: TextStyle(
                        fontSize: Sizes.size12,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
                Gaps.v1,
                Text(
                  body,
                  style: const TextStyle(
                    fontSize: Sizes.size12,
                  ),
                ),
              ],
            ),
          ),
          Gaps.h5,
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
