import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final UserRepository _userRepository;
  int page = 10;
  bool fetching = false;

  OrderCubit(this._userRepository) : super(const OrderState());

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

  void resetState(String? currentStatus) {
    emit(state.copyWith(
        status: OrdersStatus.initial,
        loadedOrder: List.empty(),
        hasReachedMax: false,
        orderValidationStatus: currentStatus));
  }
}