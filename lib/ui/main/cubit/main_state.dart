import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';

enum OrdersStatus { initial, error, complete, loading, listIsEmpty }

class OrdersState extends Equatable {
  final int ordersCount;
  final OrdersStatus status;
  final List<Order> loadedOrders;
  final bool hasReachedMax;
  final String orderValidationStatus;

  const OrdersState({
    this.loadedOrders = const <Order> [],
    this.ordersCount = 0,
    this.status = OrdersStatus.initial,
    this.hasReachedMax = false,
    this.orderValidationStatus = 'PEDNING_APPROVAL',
  });

  OrdersState copyWith({
    List<Order>? loadedOrder,
    int? ordersCount,
    OrdersStatus? status,
    bool? hasReachedMax,
    String? orderValidationStatus,
  }) {
    return OrdersState(
      loadedOrders: loadedOrder ?? this.loadedOrders,
      status: status ?? this.status,
      ordersCount: ordersCount ?? this.ordersCount,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      orderValidationStatus: orderValidationStatus ?? this.orderValidationStatus,
    );
  }

  @override
  List<Object> get props =>
      [ordersCount, status, orderValidationStatus, loadedOrders];
}