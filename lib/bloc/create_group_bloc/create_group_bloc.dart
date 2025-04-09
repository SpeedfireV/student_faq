import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_event.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_state.dart';
import 'package:student_faq/services/database_service.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  CreateGroupBloc() : super(CreateGroupInitial()) {
    on<CreateGroupSubmitForm>((event, emit) async {
      emit(CreateGroupParsing());
      try {
        await DatabaseService.createGroup(event.group);
        emit(CreateGroupSuccessful());
      } on FirebaseException catch (e) {
        emit(CreateGroupUnsuccessful(e));
      } catch (e) {
        emit(CreateGroupError(e));
      }
    });
  }
}
