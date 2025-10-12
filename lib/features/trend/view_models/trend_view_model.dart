import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/error/exceptions/custom_exceptions.dart';
import 'package:jnu_alarm/features/trend/models/trend_model.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_model.dart';
import 'package:jnu_alarm/features/trend/repos/trend_repo.dart';

class TrendViewModel extends AsyncNotifier<TrendModel> {
  PopularNoticeListModel defaultPopularNoticeList =
      const PopularNoticeListModel(daily_top: [], weekly_top: []);

  @override
  Future<TrendModel> build() async {
    final popularNoticeList = await fetchPopularNotices();
    return TrendModel(popularNoticeList: popularNoticeList);
  }

  Future<void> refresh() async {
    final popularNoticeList = await fetchPopularNotices();
    state = AsyncValue.data(TrendModel(popularNoticeList: popularNoticeList));
  }

  Future<PopularNoticeListModel> fetchPopularNotices() async {
    PopularNoticeResponseModel? popularNoticeResponse;
    try {
      popularNoticeResponse = await TrendRepo.fetchPopularNotices();
    } on ApiInternalServerException catch (e) {
      debugPrint(e.message);
    }
    return popularNoticeResponse?.response ?? defaultPopularNoticeList;
  }
}

final trendProvider =
    AsyncNotifierProvider<TrendViewModel, TrendModel>(() => TrendViewModel());
