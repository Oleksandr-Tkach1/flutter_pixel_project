import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;
  String currentStatus = 'PEDNING_APPROVAL'; // это дефотный статус который мы
  // хотим отобразить при старте апки когда еще юзер ничего сам не выбрал

  MainCubit(this._userRepository) : super(const OrdersState());

  setCurrentStatus(String status) {
    currentStatus = status; //Запоминаем  тот статус который ввел юзер
    // и передал в этот метод при клике в менюшке
  }

  getOrders(String status) {
    //setCurrentStatus
    emit(state.copyWith(status: OrdersStatus.loading));
    _userRepository.getOrders(status).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      if (orders.payload?.length == null || orders.payload!.isEmpty) {
        emit(state.copyWith(status: OrdersStatus.listIsEmpty));
      }
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(status: OrdersStatus.error));
      }
    });
  }
}
