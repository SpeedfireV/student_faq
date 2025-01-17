import 'package:freezed_annotation/freezed_annotation.dart';


import 'package:student_faq/models/question_model.dart';

part 'session_model.g.dart';
part 'session_model.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session ({
    required String sessionName,
    required List<Question> questions,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json)
  => _$SessionFromJson(json);
}