import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class PopularNoticeItemModel {
  final NoticeModel notice;
  final int? hits;
  final String? trend;

  PopularNoticeItemModel({required this.notice, this.hits, this.trend});
}
