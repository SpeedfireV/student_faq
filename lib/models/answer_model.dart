import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.g.dart';
part 'answer_model.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required int author,
    required String questionContents,
    required DateTime dateTime,
  }) = _Answer;

  factory Answer.fromJson(Map<String, Object?> json) => _$AnswerFromJson(json);
}