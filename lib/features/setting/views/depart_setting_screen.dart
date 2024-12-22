import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/constants/depart_setting_const.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/get_setting_screen_body.dart';

class DepartSettingScreen extends ConsumerWidget {
  static const routeName = "/depart-setting";
  const DepartSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(departNoticeSettingProvider);
    final settingsNotifier = ref.read(departNoticeSettingProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "학과 설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: getSettingScreenBody(
          settings, context, settingsNotifier, departSettingSectionGroup),
    );
  }
}
