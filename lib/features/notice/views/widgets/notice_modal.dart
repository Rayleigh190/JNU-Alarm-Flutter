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
              const Text(
                "읽음 여부",
                style: TextStyle(fontSize: 16),
              ),
              Gaps.v12,
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
                    noticesNotifier.refresh();
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
            ],
          ),
        ),
      ),
    );
  }
}
