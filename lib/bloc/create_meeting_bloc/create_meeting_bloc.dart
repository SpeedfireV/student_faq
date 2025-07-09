import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/services/database_service.dart';

part 'create_meeting_event.dart';
part 'create_meeting_state.dart';

class CreateMeetingBloc extends Bloc<CreateMeetingEvent, CreateMeetingState> {
  CreateMeetingBloc() : super(CreateMeetingInitial()) {
    on<AddMeetingEvent>((event, emit) async {
      emit(AddingMeetingState());
      try {
        final Meeting meeting = Meeting(sessionName: event.name, creationDate: DateTime.now());
        await DatabaseService.addMeeting(event.groupId, meeting);
        emit(SuccessfullyAddedMeetingState());
      }
      on FirebaseException catch (e) {
        emit(FailedToAddMeetingState(e.message ?? "Unknown Exception"));
      }
      on Exception catch (e) {
        emit(FailedToAddMeetingState(e.toString()));
      }
    });
  }
}
