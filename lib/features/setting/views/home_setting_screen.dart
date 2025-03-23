import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/constants/home_setting_const.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/get_setting_screen_body.dart';

class HomeSettingScreen extends ConsumerWidget {
  static const routeName = "/home-setting";
  const HomeSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(homeNoticeSettingProvider);
    final settingsNotifier = ref.read(homeNoticeSettingProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "학사/장학 설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: getSettingScreenBody(
          settings, context, settingsNotifier, homeSettingSectionGroup),
    );
  }
}
