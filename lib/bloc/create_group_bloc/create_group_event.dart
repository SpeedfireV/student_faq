import 'package:student_faq/models/group/group_model.dart';

sealed class CreateGroupEvent {}

class CreateGroupSubmitForm extends CreateGroupEvent {
  final Group group;
  CreateGroupSubmitForm(this.group);
}
