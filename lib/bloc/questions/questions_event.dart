part of 'questions_bloc.dart';

@immutable
sealed class QuestionsEvent {}

class FetchMoreQuestionsEvent extends QuestionsEvent {
  final String groupId;
  final String meetingId;
  final String questionId;

  FetchMoreQuestionsEvent(this.groupId, this.meetingId, this.questionId);
}