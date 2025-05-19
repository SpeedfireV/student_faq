part of 'meetings_bloc.dart';

@immutable
sealed class MeetingsState {}

final class MeetingsInitial extends MeetingsState {}

final class FetchingMeetingsState extends MeetingsState {}

final class SuccessfullyFetchedMeetingsState extends MeetingsState {
  final bool everyMeetingAlreadyFetched;

  SuccessfullyFetchedMeetingsState(this.everyMeetingAlreadyFetched);
}

final class FailedToFetchMeetingsState extends MeetingsState {
  final String errorMessage;

  FailedToFetchMeetingsState(this.errorMessage);
}