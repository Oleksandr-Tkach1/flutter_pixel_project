import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'orders_dashboard_state.dart';

class OrdersDashboardCubit extends Cubit<OrdersDashboardState> {
  final UserRepository _userRepository;
  int page = 10;
  bool fetching = false;

  OrdersDashboardCubit(this._userRepository) : super(const OrdersDashboardState());

  void fetchOrders() async {
    if (state.hasReachedMax) {
      emit(state);
      return;
    }
    if (state.status == OrdersStatus.initial && !fetching) {
      emit(state.copyWith(
        status: OrdersStatus.loading,
      ));
      final orders = await _fetchOrders(10);
      emit(state.copyWith(
        status: orders!.isNotEmpty ? OrdersStatus.complete : OrdersStatus.listIsEmpty,
        loadedOrder: orders,
        hasReachedMax: false,
      ));
      return;
    }
    if (fetching) return;
    final orders = await _fetchOrders(page);
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

  Future<List<Order>?> _fetchOrders(int page) async {
    fetching = true;
    return _userRepository
        .getOrdersDashboard(page)
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
    ));
  }
}