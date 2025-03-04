import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection spSchoolSettingSection = SettingSection(
  title: "각 특수대학원 홈페이지에 새 공지사항이 올라오면 알려드립니다.",
  tiles: [
    SwitchTile(
      title: "교육대학원",
      topic: "edutop",
    ),
    SwitchTile(
      title: "산업대학원",
      topic: "gsit",
    ),
    SwitchTile(
      title: "정책대학원",
      topic: "cnugspp",
    ),
    SwitchTile(
      title: "식물방역대학원",
      topic: "gpq",
    ),
    SwitchTile(
      title: "산학협력대학원",
      topic: "ieccu",
    ),
    SwitchTile(
      title: "수산해양대학원",
      topic: "gradsea",
    ),
  ],
);

const List<SettingSection> spSchoolSettingSectionGroup = [
  spSchoolSettingSection,
];
