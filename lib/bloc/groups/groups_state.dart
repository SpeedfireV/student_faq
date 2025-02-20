part of 'groups_bloc.dart';

@immutable
sealed class GroupsState {}

final class GroupsInitial extends GroupsState {}

final class GroupsStateAddingGroups extends GroupsState {}

final class GroupsStateFetched extends GroupsState {}

final class GroupsStateError extends GroupsState {
  final String errorMessage;

  GroupsStateError(this.errorMessage);
}