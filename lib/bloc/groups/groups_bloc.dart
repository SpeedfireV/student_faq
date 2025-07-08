import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/services/database_service.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  List<Group> groups = [];
  Iterable<String> groupsUids = [];
  GroupsBloc() : super(GroupsInitial()) {
    on<GroupsEventFetchNextGroups>((event, emit) async {
      emit(GroupsStateAddingGroups());
      try {
        groupsUids = await DatabaseService.getGroupsUids();
        int loadedGroupsNumber = groups.length;
        final allUids = groupsUids.toList();
        final end = (loadedGroupsNumber + 3).clamp(0, allUids.length);
        final uidsToLoad = allUids.sublist(loadedGroupsNumber, end);

        for (String uid in uidsToLoad) {
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
