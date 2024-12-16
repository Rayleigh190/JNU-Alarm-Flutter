import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class DatabaseTestScreen extends ConsumerStatefulWidget {
  const DatabaseTestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DatabaseTestScreenState();
}

class _DatabaseTestScreenState extends ConsumerState<DatabaseTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                for (int i = 0; i < 5; i++) {
                  final newNotice = NoticeModel(
                    id: i,
                    title: "제목$i",
                    body: "내용$i",
                    link: "링크$i",
                    created_at: DateTime.now(),
                  );
                  final insertedId =
                      await DatabaseHelper.insertNotice(newNotice);
                  print("Inserted notice with ID: $insertedId");
                }
              },
              child: const Text("create"),
            ),
            TextButton(
              onPressed: () async {
                final notices = await DatabaseHelper.fetchNotices(0, 15);
                print("Read notice with ID: $notices");
              },
              child: const Text("read"),
            ),
            TextButton(
              onPressed: () async {
                final updatedId =
                    await DatabaseHelper.updateNoticeReadStatus(4, 1);
                print("Updated notice with ID: $updatedId");
              },
              child: const Text("Set read"),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.deleteDatabase();
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * 1. 구독 정보가 있으면 최근 20개 알림을 받아와 db에 저장
 * 2. 현재 저장된 알림이 없으면 현재 시간 기준 이후의 알림을 가져와 저장함
 * 3. 있으면 저장된 마지막 알림 시간 기준 이후의 알림을 가져와 저장함
 * 
 * - 알림 읽으면 읽음처리
 * 
 */