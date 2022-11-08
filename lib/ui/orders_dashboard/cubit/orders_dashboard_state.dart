import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';

enum OrdersStatus { initial, error, complete, loading, listIsEmpty }

class OrdersDashboardState extends Equatable {
  final OrdersStatus status;
  final List<Order> loadedOrders;
  final bool hasReachedMax;

  const OrdersDashboardState({
    this.loadedOrders = const <Order> [],
    this.status = OrdersStatus.initial,
    this.hasReachedMax = false,
  });

  OrdersDashboardState copyWith({
    List<Order>? loadedOrder,
    OrdersStatus? status,
    bool? hasReachedMax,
  }) {
    return OrdersDashboardState(
      loadedOrders: loadedOrder ?? this.loadedOrders,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props =>
      [status, loadedOrders];
}