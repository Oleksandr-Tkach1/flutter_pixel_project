import 'package:equatable/equatable.dart';

enum OrdersStatus { initial, error, complete, loading }

class OrdersState extends Equatable {
  final int ordersCount;
  final OrdersStatus status;

  const OrdersState({
    this.ordersCount = 0,
    this.status = OrdersStatus.initial,
  });

  OrdersState copyWith({
  int? ordersCount,
  OrdersStatus? status,
  }) {
    return OrdersState(
      status: status ?? this.status,
      ordersCount: ordersCount ?? this.ordersCount,
    );
  }

  @override
  List<Object> get props =>
      [ordersCount, status];
}