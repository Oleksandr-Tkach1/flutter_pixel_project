import 'package:equatable/equatable.dart';
import 'package:flutter_pixel_project/data/model/order_details/Images.dart';
import 'package:flutter_pixel_project/data/model/order_details/Payload.dart';

enum Status { initial, error, complete, loading }

class OrderDetailsState extends Equatable {
  final Payload? orderDetails;
  final Status status;
  final String errorMessage;
  final List<Images>? images;

  const OrderDetailsState({
    this.orderDetails,
    this.status = Status.initial,
    this.errorMessage = '',
    this.images = const <Images>[],
  });

  OrderDetailsState copyWith({
    Payload? orderDetails,
    Status? status,
    String? errorMessage,
    List<Images>? images,
  }) {
    return OrderDetailsState(
      orderDetails: orderDetails ?? this.orderDetails,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props =>
      [
        orderDetails,
        status,
        errorMessage,
        images.toString(),
      ];
}