import 'package:bloc/bloc.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/services/database_service.dart';

part 'responses_event.dart';
part 'responses_state.dart';

class ResponsesBloc extends Bloc<ResponsesEvent, ResponsesState> {
  List<Answer> alreadyFetchedAnswers = [];
  ResponsesBloc() : super(ResponsesInitial()) {
    on<FetchResponsesEvent>((event, emit) async {
      emit(ResponsesLoading());
      try {
        alreadyFetchedAnswers = await DatabaseService.getAnswers(
            event.groupId, event.meetingId, event.questionId);
        emit(FetchedResponsesState());
      } catch (e) {
        emit(FailedToFetchResponsesState(e.toString()));
      }
    });
    on<AddResponseEvent>((event, emit) async {
      emit(AddingResponseState());
      try {
        alreadyFetchedAnswers = [event.answer, ...alreadyFetchedAnswers];
        await DatabaseService.addAnswer(
            event.groupId, event.meetingId, event.questionId, event.answer);

        emit(AddedResponseState());
      } catch (e) {
        alreadyFetchedAnswers.remove(event.answer);
        emit(FailedToAddResponseState(e.toString()));
      }
    });
  }
}
