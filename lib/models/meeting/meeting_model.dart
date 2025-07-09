import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_faq/models/question/question_model.dart';

part 'meeting_model.g.dart';
part 'meeting_model.freezed.dart';

@freezed
class Meeting with _$Meeting {
  factory Meeting({
    @JsonKey(includeToJson: false, includeFromJson: false) String? groupUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? uid,
    required String sessionName,
    String? description,
    required DateTime creationDate,
    DateTime? endDate,
  }) = _Meeting;


  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);
}
