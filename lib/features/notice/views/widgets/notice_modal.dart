import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';

class NoticeModal extends ConsumerStatefulWidget {
  const NoticeModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeModalState();
}

class _NoticeModalState extends ConsumerState<NoticeModal> {
  @override
  Widget build(BuildContext context) {
    final noticesNotifier = ref.read(noticeProvider.notifier);
    var selectedSegment = noticesNotifier.isRead != null
        ? noticesNotifier.isRead!
            ? 0
            : 1
        : -1;
    var selectedSegment2 = noticesNotifier.isBookmarked != null
        ? noticesNotifier.isBookmarked!
            ? 0
            : 1
        : -1;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "필터",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Gaps.v16,
              const Text(
                "읽음 여부",
                style: TextStyle(fontSize: 16),
              ),
              Gaps.v5,
              CupertinoSlidingSegmentedControl<int>(
                groupValue: selectedSegment,
                onValueChanged: (int? value) {
                  if (value != null) {
                    noticesNotifier.isRead = value > -1
                        ? value == 0
                            ? true
                            : false
                        : null;
                    setState(() {
                      selectedSegment = value;
                    });
                    noticesNotifier.refresh(skipNetwork: true);
                  }
                },
                children: const <int, Widget>{
                  -1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('전체'),
                  ),
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('읽음'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('안읽음'),
                  ),
                },
              ),
              Gaps.v16,
              const Text(
                "북마크 여부",
                style: TextStyle(fontSize: 16),
              ),
              Gaps.v5,
              CupertinoSlidingSegmentedControl<int>(
                groupValue: selectedSegment2,
                onValueChanged: (int? value) {
                  if (value != null) {
                    noticesNotifier.isBookmarked = value > -1
                        ? value == 0
                            ? true
                            : false
                        : null;
                    setState(() {
                      selectedSegment2 = value;
                    });
                    noticesNotifier.refresh(skipNetwork: true);
                  }
                },
                children: const <int, Widget>{
                  -1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('전체'),
                  ),
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('북마크O'),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text('북마크X'),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
