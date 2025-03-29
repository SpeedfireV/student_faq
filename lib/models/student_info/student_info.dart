import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';

part 'student_info.g.dart';
part 'student_info.freezed.dart';

@freezed
class StudentInfo with _$StudentInfo {
  const factory StudentInfo({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "groups") required List<Group> groups,
    @JsonKey(name: "meetings") required List<Meeting> meetings,
  }) = _StudentInfo;

  factory StudentInfo.fromJson(Map<String, Object?> json) =>
      _$StudentInfoFromJson(json);
}
