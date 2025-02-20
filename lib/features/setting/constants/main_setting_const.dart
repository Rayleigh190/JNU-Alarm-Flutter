import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/views/business_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/college_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/depart_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/info_screen.dart';
import 'package:jnu_alarm/features/setting/views/sg_school_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_icon.dart';

const SettingSection basicSettingSection = SettingSection(
  title: "일반",
  tiles: [
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff009cdf),
        icons: Icons.notifications,
      ),
      title: "서비스 알림",
      topic: "basic",
      enabled: false,
    ),
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff973999),
        icons: Icons.savings,
      ),
      title: "홍보/광고",
      topic: "ad",
    ),
  ],
);

const SettingSection collegeSettingSection = SettingSection(
  title: "대학",
  tiles: [
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.school,
      ),
      title: "학사 알림",
      topic: "academic",
    ),
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.redeem,
      ),
      title: "장학 알림",
      topic: "scholarship",
    ),
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.account_balance,
      ),
      title: "단과대 알림",
      to: CollegeSettingScreen.routeName,
    ),
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.book,
      ),
      title: "학과 알림",
      to: DepartSettingScreen.routeName,
    ),
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.auto_awesome,
      ),
      title: "전문대학원 알림",
      to: SgSchoolSettingScreen.routeName,
    ),
  ],
);

const SettingSection businessSettingSection = SettingSection(
  title: "사업단",
  tiles: [
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xfff78200),
        icons: Icons.domain,
      ),
      title: "사업단 알림",
      to: BusinessettingScreen.routeName,
    ),
  ],
);

const SettingSection etcSettingSection = SettingSection(
  title: "기타",
  tiles: [
    WebViewTile(
      icon: SettingsIcon(
        color: Color(0xffe23838),
        icons: Icons.support_agent,
      ),
      title: "문의 및 제안",
      link: "https://forms.gle/UsGc7w7gJ8Tw8FYNA",
    ),
    WebViewTile(
      icon: SettingsIcon(
        color: Color(0xff009cdf),
        icons: Icons.help_outline,
      ),
      title: "FAQ",
      link:
          "https://wackitlab.notion.site/FAQ-b0f2438e25574315baa0962d1dd250e5",
    ),
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xff009cdf),
        icons: Icons.info_outline,
      ),
      title: "정보",
      to: InfoScreen.routeName,
    ),
  ],
);

const SettingSection devModeSettingSection = SettingSection(
  title: "개발자 모드",
  tiles: [
    SwitchTile(
      icon: SettingsIcon(
        color: Colors.grey,
        icons: Icons.bug_report,
      ),
      title: "테스트 알림",
      topic: "test",
    ),
    SwitchTile(
      icon: SettingsIcon(
        color: Colors.grey,
        icons: Icons.bug_report,
      ),
      title: "테스트2 알림",
      topic: "test2",
    ),
  ],
);

const List<SettingSection> mainSettingSectionGroup = [
  basicSettingSection,
  collegeSettingSection,
  businessSettingSection,
  etcSettingSection,
];

const List<SettingSection> mainSettingSectionGroupWithDev = [
  basicSettingSection,
  collegeSettingSection,
  businessSettingSection,
  etcSettingSection,
  devModeSettingSection,
];
