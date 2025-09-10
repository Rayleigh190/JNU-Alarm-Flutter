import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';

class NoticeTile extends ConsumerStatefulWidget {
  const NoticeTile({
    super.key,
    required this.id,
    required this.title,
    required this.body,
    required this.link,
    required this.createdAt,
    required this.isRead,
    required this.isBookmarked,
    this.isEditMode = false,
    this.onDeleteTap,
  });

  final int id;
  final String title;
  final String body;
  final String link;
  final DateTime createdAt;
  final bool isRead;
  final bool isBookmarked;
  final bool isEditMode;
  final void Function()? onDeleteTap;

  @override
  ConsumerState<NoticeTile> createState() => _NoticeTileState();
}

class _NoticeTileState extends ConsumerState<NoticeTile> {
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
      padding: const EdgeInsets.fromLTRB(
          Sizes.size16, Sizes.size10, Sizes.size14, Sizes.size10),
      child: Row(
        children: [
          widget.isEditMode
              ? GestureDetector(
                  onTap: () => widget.onDeleteTap?.call(),
                  child: const Icon(
                    Icons.do_not_disturb_on_total_silence_outlined,
                    color: Colors.red,
                  ),
                )
              : Icon(
                  widget.isRead
                      ? Icons.check_circle_outline
                      : Icons.error_outline,
                  color: widget.isRead
                      ? Colors.grey.shade400
                      : Theme.of(context).primaryColor,
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
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      getFormattedTime(widget.createdAt),
                      style: TextStyle(
                        fontSize: Sizes.size12,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
                Gaps.v1,
                Text(
                  widget.body,
                  style: const TextStyle(
                    fontSize: Sizes.size12,
                  ),
                ),
              ],
            ),
          ),
          Gaps.h3,
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.fromLTRB(2, 3, 2, 3),
              child: Icon(
                widget.isBookmarked
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color:
                    widget.isBookmarked ? Colors.amber : Colors.grey.shade400,
              ),
            ),
            onTap: () {
              ref
                  .read(noticeProvider.notifier)
                  .toggleBookmark(widget.id, widget.isBookmarked ? 1 : 0);
            },
          ),
        ],
      ),
    );
  }
}
