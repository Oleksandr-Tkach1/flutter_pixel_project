import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;
  int page = 10;
  bool fetching = false;

  MainCubit(this._userRepository) : super(const OrdersState());

  setCurrentStatus(String status) {
    emit(state.copyWith(
      orderValidationStatus: status,
    ));
  }

  void fetchActivities() async {
    if (state.hasReachedMax) {
      emit(state);
      return;
    }
    // if (state.status == OrdersStatus.initial && !fetching) {
    //   final activities = await _fetchActivities(10, state.orderValidationStatus);
    //   emit(state.copyWith(
    //     status: OrdersStatus.complete,
    //     loadedOrder: activities,
    //     hasReachedMax: false,
    //   ));
    //   return;
    // }
    if (fetching) return;
    final orders = await _fetchOrders(page, state.orderValidationStatus);
    if (orders == null) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        loadedOrder: List.of(state.loadedOrder)..addAll(orders),
        hasReachedMax: false,
      ));
      page+=10;
    }
  }


  Future<dynamic> _fetchOrders([int? page, String? status]) async {
    fetching = true;
    return _userRepository.getOrders(page!, status!).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      return orders.payload;
    }).whenComplete(() => fetching = false).catchError((Object obj) {
      fetching = false;
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(status: OrdersStatus.error));
      }
    });
  }

  getOrders([int? page, String? status]) async{
    emit(state.copyWith(status: OrdersStatus.loading));
    return
    _userRepository.getOrders(page!, status!).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      if (orders.payload?.length == null || orders.payload!.isEmpty) {
        emit(state.copyWith(status: OrdersStatus.listIsEmpty));
      }
      return orders;
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(status: OrdersStatus.error));
      }
    });
  }
}