import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<int> {
  SetupCubit() : super(0);
  void nextPage() async {
    if (state == 0) {
      emit(state + 1);
    } else if (state == 1) {
      emit(state + 1);
    } else if (state == 2) {
      if (true) {
        emit(state + 1);
      }
    }
  }
}
