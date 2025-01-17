import 'package:freezed_annotation/freezed_annotation.dart';

import 'answer_model.dart';

part 'question_model.freezed.dart';

part 'question_model.g.dart';


@freezed
class Question with _$Question {

  const factory Question ({

    required String questionName,
    required List<Answer> answers,
    required DateTime dateTime,
    @Default(false) bool answered,
  }) = _Question;

  factory Question.fromJson(Map<String, Object?> json)
  => _$QuestionFromJson(json);
}