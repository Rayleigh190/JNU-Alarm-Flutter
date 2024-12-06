import 'package:flutter/material.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/views/business_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/college_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/depart_setting_screen.dart';
import 'package:jnu_alarm/features/setting/views/widgets/settings_icon.dart';

const SettingSection basicSettingSection = SettingSection(
  title: "일반",
  tiles: [
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff009cdf),
        icons: Icons.notifications,
      ),
      title: "기본 알림",
      topic: "basic",
    ),
    SwitchTile(
      icon: SettingsIcon(
        color: Color(0xff973999),
        icons: Icons.campaign,
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
      to: CollegeSettingScreen(),
    ),
    NavigationTile(
      icon: SettingsIcon(
        color: Color(0xff5ebd3e),
        icons: Icons.book,
      ),
      title: "학과 알림",
      to: DepartSettingScreen(),
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
      to: BusinessettingScreen(),
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
  devModeSettingSection,
];