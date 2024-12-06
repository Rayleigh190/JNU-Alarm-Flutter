import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection sgSchoolSettingSection = SettingSection(
  title: "각 전문대학원 홈페이지에 새 공지사항이 올라오면 알려드립니다.",
  tiles: [
    SwitchTile(
      title: "경영전문대학원",
      topic: "mba",
    ),
    SwitchTile(
      title: "문화전문대학원",
      topic: "culture",
    ),
    SwitchTile(
      title: "치의학전문대학원",
      topic: "dent",
    ),
    SwitchTile(
      title: "법학전문대학원",
      topic: "lawschool",
    ),
    SwitchTile(
      title: "데이터사이언스대학원",
      topic: "ds",
    ),
  ],
);

const List<SettingSection> sgSchoolSettingSectionGroup = [
  sgSchoolSettingSection,
];
