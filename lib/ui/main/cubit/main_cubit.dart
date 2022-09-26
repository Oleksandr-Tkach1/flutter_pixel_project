import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;

  MainCubit(this._userRepository) : super(const OrdersState());


  getOrders(){
    emit(state.copyWith(status: OrdersStatus.loading));
    _userRepository.getOrders().then((orders) {
      emit(state.copyWith(
          status: OrdersStatus.complete,
          ordersCount: orders.payload?.length
      ));
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(
              status: OrdersStatus.error));
      }
    });
  }
}