part of 'create_meeting_bloc.dart';

@immutable
sealed class CreateMeetingEvent {}

final class AddMeetingEvent extends CreateMeetingEvent {
  final String groupId;
  final String name;
  final String? description;

  AddMeetingEvent(this.groupId, this.name, {this.description});
}

