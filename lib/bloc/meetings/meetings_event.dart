part of 'meetings_bloc.dart';

@immutable
sealed class MeetingsEvent {}


class FetchMoreMeetingsEvent extends MeetingsEvent {
  final String groupId;

  FetchMoreMeetingsEvent(this.groupId);
}






