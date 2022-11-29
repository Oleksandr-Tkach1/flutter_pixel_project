import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {

  MainCubit(): super(const MainState());

  void setCurrentNavigationItem(int index) {
    emit(state.copyWith(currentNavigationItem: index));
  }
}