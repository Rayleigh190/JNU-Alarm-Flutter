import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/notice/models/top_banner_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';

class TopBannerViewModel extends AsyncNotifier<List<TopBannerModel>> {
  Future<List<TopBannerModel>> _fetchTopBanner() async {
    final response = await NoticeRepository.fetchTopBanner();
    return response.response;
  }

  @override
  Future<List<TopBannerModel>> build() async {
    return _fetchTopBanner();
  }
}

final topBannerProvider =
    AsyncNotifierProvider<TopBannerViewModel, List<TopBannerModel>>(
        () => TopBannerViewModel());
