import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:student_faq/models/answer/answer_model.dart';

part 'question_model.freezed.dart';

part 'question_model.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(includeToJson: false, includeFromJson: false) String? groupUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? meetingUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? uid,
    required String questionName,
    required DateTime dateTime,
    @JsonKey(defaultValue: 0) int? likes,
    @JsonKey(defaultValue: 0) int? answersCount,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json) =>
      _$QuestionFromJson(json);
}
