import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_setting_model.freezed.dart';

@freezed
class NoticeSettingModel with _$NoticeSettingModel {
  const factory NoticeSettingModel({
    required Map<String, bool> topics,
  }) = _NoticeSettingModel;
}
