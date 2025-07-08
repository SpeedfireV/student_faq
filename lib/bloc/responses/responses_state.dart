part of 'responses_bloc.dart';

sealed class ResponsesState {
  const ResponsesState();
}

class ResponsesInitial extends ResponsesState {}

class ResponsesLoading extends ResponsesState {}

class ResponsesError extends ResponsesState {
  final String errorMessage;

  ResponsesError(this.errorMessage);
}

class ResponsesLoaded extends ResponsesState {}

class FetchingResponsesState extends ResponsesLoading {}

class FailedToFetchResponsesState extends ResponsesError {
  FailedToFetchResponsesState(super.errorMessage);
}

class FetchedResponsesState extends ResponsesLoaded {}

class AddingResponseState extends ResponsesLoading {}

class FailedToAddResponseState extends ResponsesError {
  FailedToAddResponseState(super.errorMessage);
}

class AddedResponseState extends ResponsesLoaded {}
