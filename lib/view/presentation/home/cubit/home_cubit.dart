import 'package:alvoiz/view/presentation/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  int lastSound = 0;

  void changeLastSound(int index) {
    lastSound = index;
    emit(HomeChangeState());
  }

  void emitter() {
    emit(HomeChangeState());
  }
}
