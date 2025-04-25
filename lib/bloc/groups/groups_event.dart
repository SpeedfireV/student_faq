part of 'groups_bloc.dart';

@immutable
sealed class GroupsEvent {}

class GroupsEventFetchNextGroups extends GroupsEvent {
}

class GroupsEventAddGroup extends GroupsEvent {}

class GroupsEventDeleteGroup extends GroupsEvent {}

class GroupsEventFetchGroupsUids extends GroupsEvent {}
