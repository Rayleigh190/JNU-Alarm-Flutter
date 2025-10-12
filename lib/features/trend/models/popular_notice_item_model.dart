import 'package:jnu_alarm/features/notice/models/notice_model.dart';

class PopularNoticeItemModel {
  final NoticeModel notice;
  final int hits;

  PopularNoticeItemModel({required this.notice, required this.hits});
}
