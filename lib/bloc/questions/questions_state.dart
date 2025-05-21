part of 'questions_bloc.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class FetchingQuestionsState extends QuestionsState {}

final class SuccessfullyFetchedQuestionsState extends QuestionsState {
  final bool everyQuestionAlreadyFetched;

  SuccessfullyFetchedQuestionsState(this.everyQuestionAlreadyFetched);
}

final class FailedToFetchQuestionsState extends QuestionsState {
  final String errorMessage;

  FailedToFetchQuestionsState(this.errorMessage);
}

