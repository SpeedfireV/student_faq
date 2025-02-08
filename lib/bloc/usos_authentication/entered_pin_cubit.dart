import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class EnteredPinCubit extends Cubit<String> {
  EnteredPinCubit() : super("");
  void changePin(String newPin) {
    emit(newPin);
  }
}
