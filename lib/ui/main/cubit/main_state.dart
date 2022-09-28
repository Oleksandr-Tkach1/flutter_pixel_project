import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';

enum OrdersStatus { initial, error, complete, loading }

class OrdersState extends Equatable {
  final int ordersCount;
  final OrdersStatus status;
  final List<Order>? loadedOrder;

  const OrdersState({
    this.loadedOrder,
    this.ordersCount = 0,
    this.status = OrdersStatus.initial,
  });

  OrdersState copyWith({
  List<Order>? loadedOrder,
  int? ordersCount,
  OrdersStatus? status,
  }) {
    return OrdersState(
      loadedOrder: loadedOrder ?? this.loadedOrder,
      status: status ?? this.status,
      ordersCount: ordersCount ?? this.ordersCount,
    );
  }

  @override
  List<Object> get props =>
      [ordersCount, status];
}