import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/services/database_service.dart';

part 'meetings_event.dart';
part 'meetings_state.dart';

class MeetingsBloc extends Bloc<MeetingsEvent, MeetingsState> {
  List<Meeting> fetchedMeetings = [];
  MeetingsBloc() : super(MeetingsInitial()) {
    on<FetchMoreMeetingsEvent>((event, emit) async {
      emit(FetchingMeetingsState());
      try {
        fetchedMeetings.addAll((await DatabaseService.getMeetings(event.groupId, fetchedMeetings.isNotEmpty ? fetchedMeetings.last : null)));
            emit(SuccessfullyFetchedMeetingsState(false)); // TODO : If already fetched all docs then true

        } on FirebaseException catch (e) {
        emit(FailedToFetchMeetingsState(e.message ?? "Unknown Exception"));
      }
    });
  }
}
