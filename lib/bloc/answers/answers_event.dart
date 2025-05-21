part of 'answers_bloc.dart';

@immutable
sealed class AnswersEvent {}

class FetchMoreAnswersEvent extends AnswersEvent {
  final String groupId;
  final String meetingId;
  final String questionId;

  FetchMoreAnswersEvent(this.groupId, this.meetingId, this.questionId);
}