import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:student_faq/models/question/question_model.dart';

import '../../services/database_service.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final List<Question> alreadyFetchedQuestions = [];
  QuestionsBloc() : super(QuestionsInitial()) {
    on<FetchMoreQuestionsEvent>((event, emit) async {
      emit(FetchingQuestionsState());
      try {var a = (await DatabaseService.getQuestions(event.groupId, event.meetingId, event.questionId, alreadyFetchedQuestions.isNotEmpty ? alreadyFetchedQuestions.last : null));
      alreadyFetchedQuestions.addAll(a);
      emit(SuccessfullyFetchedQuestionsState(false)); // TODO : If already fetched all docs then true

      } on FirebaseException catch (e) {
        emit(FailedToFetchQuestionsState(e.message ?? "Unknown Exception"));
      }
    });
  }
}
