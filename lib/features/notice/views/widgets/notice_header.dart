import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_ad.dart';

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
    return const NoticeAd();
  }
}
