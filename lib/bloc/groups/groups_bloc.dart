import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/services/usos_service.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  Iterable<Group> groups = [];
  GroupsBloc() : super(GroupsInitial()) {
    on<GroupsEventAddGroups>((event, emit) async {
      emit(GroupsStateAddingGroups());
      try {
        // var fetchedGroups = await event.usosService.getProgrammes();
        // if (fetchedGroups != null) {
        //   groups = fetchedGroups;
        // }
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
