part of 'groups_bloc.dart';

@immutable
sealed class GroupsEvent {}

class GroupsEventFetchGroups extends GroupsEvent {
}

class GroupsEventAddGroup extends GroupsEvent {}

class GroupsEventDeleteGroup extends GroupsEvent {}
