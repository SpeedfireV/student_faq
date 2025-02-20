part of 'groups_bloc.dart';

@immutable
sealed class GroupsEvent {}

class GroupsEventAddGroups extends GroupsEvent {
  final UsosService usosService;
  GroupsEventAddGroups(this.usosService);
}

class GroupsEventAddGroup extends GroupsEvent {}

class GroupsEventDeleteGroup extends GroupsEvent {}
