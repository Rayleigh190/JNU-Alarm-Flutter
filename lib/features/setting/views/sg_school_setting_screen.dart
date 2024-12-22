import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/constants/sg_school_setting_const.dart';
import 'package:jnu_alarm/features/setting/view_models/notice_setting_view_model.dart';
import 'package:jnu_alarm/features/setting/views/widgets/get_setting_screen_body.dart';

class SgSchoolSettingScreen extends ConsumerWidget {
  static const routeName = "/sg-school-setting";
  const SgSchoolSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(sgSchoolNoticeSettingProvider);
    final settingsNotifier = ref.read(sgSchoolNoticeSettingProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "전문대학원 설정",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: getSettingScreenBody(
          settings, context, settingsNotifier, sgSchoolSettingSectionGroup),
    );
  }
}
