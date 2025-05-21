part of 'answers_bloc.dart';

@immutable
sealed class AnswersState {}

final class AnswersInitial extends AnswersState {}

final class FetchingAnswersState extends AnswersState {}

final class SuccessfullyFetchedAnswersState extends AnswersState {
  final bool everyAnswerAlreadyFetched;

  SuccessfullyFetchedAnswersState(this.everyAnswerAlreadyFetched);
}

final class FailedToFetchAnswersState extends AnswersState {
  final String errorMessage;

  FailedToFetchAnswersState(this.errorMessage);
}