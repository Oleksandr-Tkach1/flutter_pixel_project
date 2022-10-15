import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/order_details/Payload.dart';

enum Status { initial, error, complete, loading }

class OrderDetailsState extends Equatable {
  final Payload? orderDetails;
  final Status status;
  final String errorMessage;

  const OrderDetailsState({
    this.orderDetails,
    this.status = Status.initial,
    this.errorMessage = '',
  });

  OrderDetailsState copyWith({
    Payload? orderDetails,
    Status? status,
    String? errorMessage,
  }) {
    return OrderDetailsState(
      orderDetails: orderDetails ?? this.orderDetails,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, ];
}