import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/services/database_service.dart';

part 'answers_event.dart';
part 'answers_state.dart';

class AnswersBloc extends Bloc<AnswersEvent, AnswersState> {
  final List<Answer> alreadyFetchedAnswers = [];

  AnswersBloc() : super(AnswersInitial()) {
    on<FetchMoreAnswersEvent>((event, emit) async {
      emit(FetchingAnswersState());
      try {
        alreadyFetchedAnswers.addAll(await DatabaseService.getAnwers(event.groupId, event.meetingId, event.questionId));
        emit(SuccessfullyFetchedAnswersState(false));
      } on FirebaseException catch (e) {
        emit(FailedToFetchAnswersState(e.message ?? "Unknown Error"));
      } catch (e) {
        emit(FailedToFetchAnswersState("Unknown Error"));
      }
    });
  }
}
