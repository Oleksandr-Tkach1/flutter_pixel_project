import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;
  int page = 1;
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
    if (state.status == OrdersStatus.initial && !fetching) {
      final activities = await _fetchActivities(0, state.orderValidationStatus);
      emit(state.copyWith(
        status: OrdersStatus.complete,
        loadedOrder: activities,
        hasReachedMax: false,
      ));
      return;
    }
    if (fetching) return;
    final activities = await getOrders(page, state.orderValidationStatus);
    if (activities == null || activities.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        loadedOrder: List.of(state.loadedOrder)..addAll(activities),
        hasReachedMax: false,
      ));
      page++;
    }
  }

  Future<dynamic> _fetchActivities([int? page, String? status]) async {
    fetching = true;
    return _userRepository.getOrders(page!, status!).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      return orders;
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