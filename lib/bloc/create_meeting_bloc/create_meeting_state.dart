part of 'create_meeting_bloc.dart';

@immutable
sealed class CreateMeetingState {}

final class CreateMeetingInitial extends CreateMeetingState {}



final class AddingMeetingState extends CreateMeetingState {}

final class SuccessfullyAddedMeetingState extends CreateMeetingState {}

final class FailedToAddMeetingState extends CreateMeetingState {
  final String exceptionText;
  FailedToAddMeetingState(this.exceptionText);
}