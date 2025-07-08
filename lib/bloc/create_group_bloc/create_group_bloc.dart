import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_event.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  CreateGroupBloc() : super(CreateGroupInitial()) {
    on<CreateGroupSubmitForm>((event, emit) async {
      emit(CreateGroupParsing());
      try {
        debugPrint(event.group.toJson().toString());
        final HttpsCallableResult result = await FirebaseFunctions.instance
            .httpsCallable('create_group')
            .call(event.group.toJson());
        print(result.data);
        emit(CreateGroupSuccessful());
      } on FirebaseException catch (e) {
        emit(CreateGroupUnsuccessful(e));
      } on Exception catch (e) {
        emit(CreateGroupError(e));
      }
    });
  }
}
