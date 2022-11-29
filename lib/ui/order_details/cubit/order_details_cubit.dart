import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/order_details/Payload.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';

import '../../../data/model/order_details/Images.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final UserRepository _userRepository;

  OrderDetailsCubit(this._userRepository) : super(const OrderDetailsState());

  fetchOrderDetails(String id, [int? index]) {
    _fetchOrderDetails(id, index ?? 0);
  }

  Future<List<Payload>?> _fetchOrderDetails(String id, int index) async {
    emit(state.copyWith(status: Status.loading));
    return _userRepository.getOrderDetails(id).then((orderDetails) {
      emit(state.copyWith(
        status: Status.complete,
        orderDetails: orderDetails.payload,
        images: orderDetails.payload!.images,
      ));
    }).catchError((Object obj) {
      print('Error');
    });
  }

  switchRadioButton([bool? visibilityComment, var orderStatus, int? index]) {
    var images = List<Images>.from(state.images as List<Images>);

    final currentImage = Images();
    currentImage.visibilityComment = visibilityComment!;
    currentImage.status = orderStatus!;

    images[index!] = currentImage;
    emit(state.copyWith(images: images));
  }
}