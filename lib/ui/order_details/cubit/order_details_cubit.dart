import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/order_details/cubit/order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final UserRepository _userRepository;

  OrderDetailsCubit(this._userRepository) : super(const OrderDetailsState());

  fetchOrderDetails(String id, [int? index]){
    _fetchOrderDetails(id, index ?? 0);
  }

  _fetchOrderDetails(String id, int index) async {
    emit(state.copyWith(status: Status.loading));
    return _userRepository.getOrderDetails(id).then((orderDetails) {
      emit(state.copyWith(
        status: Status.complete,
        orderDetails: orderDetails.payload,
        visibilityComment: orderDetails.payload!.images![index].visibilityComment,
      ));
    });
  }
}