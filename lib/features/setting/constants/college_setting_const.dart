import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection collegeSettingSection = SettingSection(
  title: "각 단과대 홈페이지에 새 공지사항이 올라오면 알려드립니다.",
  tiles: [
    SwitchTile(
      title: "경영대학",
      topic: "cba",
    ),
    SwitchTile(
      title: "공과대학",
      topic: "eng",
    ),
    SwitchTile(
      title: "농업생명과학대학",
      topic: "agric",
    ),
    SwitchTile(
      title: "사범대학",
      topic: "education",
    ),
    SwitchTile(
      title: "사회과학대학",
      topic: "socsci",
    ),
    SwitchTile(
      title: "생활과학대학",
      topic: "humanecology",
    ),
    SwitchTile(
      title: "수의과대학",
      topic: "vetmed",
    ),
    SwitchTile(
      title: "약학대학",
      topic: "pharmacy",
    ),
    SwitchTile(
      title: "예술대학",
      topic: "arts",
    ),
    SwitchTile(
      title: "의과대학",
      topic: "medicine",
      enabled: false,
    ),
    SwitchTile(
      title: "인문대학",
      topic: "human",
    ),
    SwitchTile(
      title: "자연과학대학",
      topic: "natural",
    ),
    SwitchTile(
      title: "AI융합대학",
      topic: "cvg",
    ),
    SwitchTile(
      title: "공학대학",
      topic: "engc",
    ),
    SwitchTile(
      title: "문화사회과학대학",
      topic: "yculture",
    ),
    SwitchTile(
      title: "수산해양대학",
      topic: "sea",
    )
  ],
);

const List<SettingSection> collegeSettingSectionGroup = [
  collegeSettingSection,
];
