import 'package:cloud_firestore/cloud_firestore.dart';

sealed class CreateGroupState {}

class CreateGroupInitial extends CreateGroupState {}

class CreateGroupParsing extends CreateGroupState {}

class CreateGroupError extends CreateGroupState {
  final exception;
  CreateGroupError(this.exception);
}

class CreateGroupSuccessful extends CreateGroupState {}

class CreateGroupUnsuccessful extends CreateGroupState {
  final FirebaseException exception;
  CreateGroupUnsuccessful(this.exception);
}
