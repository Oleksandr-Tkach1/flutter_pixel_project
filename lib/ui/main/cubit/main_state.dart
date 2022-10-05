import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';

enum OrdersStatus { initial, error, complete, loading, listIsEmpty }
enum CurrentListStatus {initial, success, failure}

class OrdersState extends Equatable {
  final int ordersCount;
  final OrdersStatus status;
  final List<Order> loadedOrder;
  final CurrentListStatus currentStatus;
  final bool hasReachedMax;
  final String orderValidationStatus;

  const OrdersState({
    this.loadedOrder = const <Order> [],
    this.ordersCount = 0,
    this.status = OrdersStatus.initial,
    this.currentStatus = CurrentListStatus.initial,
    this.hasReachedMax = false,
    this.orderValidationStatus = 'PEDNING_APPROVAL',
  });

  OrdersState copyWith({
  List<Order>? loadedOrder,
  int? ordersCount,
  OrdersStatus? status,
  CurrentListStatus? currentStatus,
  bool? hasReachedMax,
  String? orderValidationStatus,
  }) {
    return OrdersState(
      loadedOrder: loadedOrder ?? this.loadedOrder,
      status: status ?? this.status,
      ordersCount: ordersCount ?? this.ordersCount,
      currentStatus: currentStatus ?? this.currentStatus,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      orderValidationStatus: orderValidationStatus ?? this.orderValidationStatus,
    );
  }

  @override
  List<Object> get props =>
      [ordersCount, status, currentStatus, orderValidationStatus];
}