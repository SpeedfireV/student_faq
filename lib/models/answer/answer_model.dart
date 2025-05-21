import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.g.dart';
part 'answer_model.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    @JsonKey(includeToJson: false, includeFromJson: false) String? groupUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? meetingUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? questionUid,
    @JsonKey(includeToJson: false, includeFromJson: false) String? uid,
    required String author,
    required String questionContents,
    required DateTime dateTime,
    String? answerId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, Object?> json) => _$AnswerFromJson(json);

}
