import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/services/database_service.dart';
import 'package:student_faq/services/usos_service.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  List<Group> groups = [];
  Iterable<String> groupsUids = [];
  GroupsBloc() : super(GroupsInitial()) {

    on<GroupsEventFetchGroupsUids>((event, emit) async {
      groupsUids = await DatabaseService.getGroupsUids();

    });
    on<GroupsEventFetchNextGroups>((event, emit) async {
      emit(GroupsStateAddingGroups());
      try {
        int loadedGroupsNumber = groups.length;
        Iterable<String> uidsOfGroupsToBeLoaded = groupsUids.toList().sublist(loadedGroupsNumber, loadedGroupsNumber + 3);
        for (String uid in uidsOfGroupsToBeLoaded) {
          groups.add(await DatabaseService.getGroup(uid));
        }
      } catch (e) {
        emit(GroupsStateError(e.toString()));
      }
      emit(GroupsStateFetched());
    });
    on<GroupsEventAddGroup>((event, emit) {
      emit(GroupsStateAddingGroups());
      // TODO: Add add group logic
      emit(GroupsStateFetched());
    });
    on<GroupsEventDeleteGroup>((event, emit) {
      emit(GroupsStateAddingGroups());
      // TODO: Add delete group logic
      emit(GroupsStateFetched());
    });
  }
}
