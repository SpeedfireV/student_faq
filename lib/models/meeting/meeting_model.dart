import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:student_faq/models/question/question_model.dart';

part 'meeting_model.g.dart';
part 'meeting_model.freezed.dart';

@freezed
class Meeting with _$Meeting {
  const factory Meeting({
    required String sessionId,
    required String sessionName,
    required List<Question> questions,
    required int likes,
    String? meetingId,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, Object?> json) =>
      _$MeetingFromJson(json);
}
