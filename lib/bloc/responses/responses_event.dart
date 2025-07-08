part of 'responses_bloc.dart';

sealed class ResponsesEvent {
  const ResponsesEvent();
}

class FetchResponsesEvent extends ResponsesEvent {
  final String groupId;
  final String meetingId;
  final String questionId;

  const FetchResponsesEvent(this.groupId, this.meetingId, this.questionId);
}

class AddResponseEvent extends ResponsesEvent {
  final String groupId;
  final String meetingId;
  final String questionId;
  final Answer answer;

  const AddResponseEvent(this.groupId, this.meetingId, this.questionId, this.answer);
}
