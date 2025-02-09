import 'package:freezed_annotation/freezed_annotation.dart';


part 'student_info.g.dart';
part 'student_info.freezed.dart';

@freezed
class StudentInfo with _$StudentInfo {
  const factory StudentInfo ({
    @JsonKey(name: "id") required String studentId,
    @JsonKey(name: "first_name") required String studentName,
    @JsonKey(name: "last_name") required String studentSurname,
}) = _StudentInfo;

  factory StudentInfo.fromJson(Map<String, Object?> json) => _$StudentInfoFromJson(json);
}