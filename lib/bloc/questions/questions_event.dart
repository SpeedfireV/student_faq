part of 'questions_bloc.dart';

@immutable
sealed class QuestionsEvent {}

class FetchMoreQuestionsEvent extends QuestionsEvent {
  final String groupId;
  final String meetingId;

  FetchMoreQuestionsEvent(this.groupId, this.meetingId);
}

class AddQuestionEvent extends QuestionsEvent {
  final String groupId;
  final String meetingId;
  final Question question;

  AddQuestionEvent(this.groupId, this.meetingId, this.question);
}
