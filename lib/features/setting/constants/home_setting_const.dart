import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection home1SettingSection = SettingSection(
  title: "전남대 홈페이지에 새 공지사항이 올라오면 알려드립니다.",
  tiles: [
    SwitchTile(
      title: "학사 알림",
      topic: "academic",
    ),
    SwitchTile(
      title: "장학 알림",
      topic: "scholarship",
    ),
  ],
);

const SettingSection home2SettingSection = SettingSection(
  title: "학사 게시판의 타 대학교 교류학생 관련 공지 알림을 받으려면 설정하세요.",
  tiles: [
    SwitchTile(
      title: "학사 | 타 대학교 교류학생 알림",
      topic: "academic_another_university",
    ),
  ],
);

const List<SettingSection> homeSettingSectionGroup = [
  home1SettingSection,
  home2SettingSection
];
