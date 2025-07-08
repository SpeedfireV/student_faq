import 'package:bloc/bloc.dart';

class KeyboardCubit extends Cubit<bool> {
  KeyboardCubit() : super(false);
  void turnOn() {
    emit(true);
  }

  void turnOff() {
    emit(false);
  }
}
