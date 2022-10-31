import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders_archive/Payload.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';

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

  void fetchOrders() async {
    if (state.hasReachedMax) {
      emit(state);
      return;
    }
    if (state.status == OrdersStatus.initial && !fetching) {
      emit(state.copyWith(
        status: OrdersStatus.loading,
      ));
      final orders = await _fetchOrders(10, state.orderValidationStatus);
      emit(state.copyWith(
        status: orders!.isNotEmpty ? OrdersStatus.complete : OrdersStatus.listIsEmpty,
        loadedOrder: orders,
        hasReachedMax: false,
      ));
      return;
    }
    if (fetching) return;
    final orders = await _fetchOrders(page, state.orderValidationStatus);
    if (orders == null) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        loadedOrder: List.of(state.loadedOrders)..addAll(orders),
        hasReachedMax: false,
      ));
      page+=10;
    }
  }

  Future<List<Order>?> _fetchOrders([int? page, String? status]) async {
    fetching = true;
    return _userRepository
        .getOrders(page!, status!)
        .then((value) => value.payload)
        .whenComplete(() => fetching = false)
        .catchError((Object obj) {
      fetching = false;
      emit(state.copyWith(status: OrdersStatus.error));
    });
  }

  ///

  fetchOrdersArchive() async {
    if (state.hasReachedMax) {
      emit(state);
      return;
    }
    if (state.status == OrdersStatus.initial && !fetching) {
      emit(state.copyWith(
        status: OrdersStatus.loading,
      ));
      final ordersArchive = await _fetchOrdersArchive(10);
      emit(state.copyWith(
        status: ordersArchive!.isNotEmpty ? OrdersStatus.complete : OrdersStatus.listIsEmpty,
        loadedOrdersArchive: ordersArchive,
        hasReachedMax: false,
      ));
      return;
    }
    if (fetching) return;
    final ordersArchive = await _fetchOrdersArchive(page);
    if (ordersArchive == null) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        loadedOrdersArchive: List.of(state.loadedOrdersArchive)..addAll(ordersArchive),
        hasReachedMax: false,
      ));
      page+=10;
    }
  }

  Future<List<Payload>?> _fetchOrdersArchive(int page) async {
    fetching = true;
    return _userRepository
        .getOrdersArchive(page)
        .then((value) => value.payload)
        .whenComplete(() => fetching = false)
        .catchError((Object obj) {
      fetching = false;
      emit(state.copyWith(status: OrdersStatus.error));
    });
  }



  showCurrentOrderScreen(String statusScreen){
    if(statusScreen == 'Orders'){
      return
      fetchOrders();
    }else if(statusScreen == 'Archive'){
      return
      fetchOrdersArchive();
    }else if (statusScreen == 'Dashboard'){
      ///TODO
    }
  }

  void resetState(String? currentStatus) {
    emit(state.copyWith(
        status: OrdersStatus.initial,
        loadedOrder: List.empty(),
        hasReachedMax: false,
        orderValidationStatus: currentStatus));
  }
}