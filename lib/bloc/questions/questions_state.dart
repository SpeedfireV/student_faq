part of 'questions_bloc.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoaded extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class AddQuestionFailed extends QuestionsState {
  final String errorMessage;

  AddQuestionFailed(this.errorMessage);
}

final class FetchingQuestionsState extends QuestionsLoading {}

final class SuccessfullyFetchedQuestionsState extends QuestionsLoaded {
  final bool everyQuestionAlreadyFetched;

  SuccessfullyFetchedQuestionsState(this.everyQuestionAlreadyFetched);
}

final class FailedToFetchQuestionsState extends AddQuestionFailed {
  FailedToFetchQuestionsState(super.errorMessage);
}

final class FailedToAddQuestionState extends AddQuestionFailed {
  FailedToAddQuestionState(super.errorMessage);
}

final class AddingQuestionState extends QuestionsLoading {}

final class QuestionAddedState extends QuestionsLoaded {}
