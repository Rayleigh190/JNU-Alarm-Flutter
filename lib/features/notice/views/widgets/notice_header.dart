import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_ad.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_modal.dart';

class NoticeHeader extends ConsumerStatefulWidget {
  const NoticeHeader({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeHeaderState();
}

class _NoticeHeaderState extends ConsumerState<NoticeHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const NoticeAd(),
        Gaps.v6,
        Row(
          children: [
            const Expanded(
              child: CupertinoSearchTextField(
                placeholder: "검색",
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt_rounded),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const NoticeModal();
                    });
              },
            ),
          ],
        ),
      ],
    );
  }
}
