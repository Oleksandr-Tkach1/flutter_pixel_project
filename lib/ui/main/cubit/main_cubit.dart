import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;
  int page = 1;
  bool fetching = false;

  MainCubit(this._userRepository) : super(const OrdersState());

  setCurrentStatus(String status) {
    emit(state.copyWith(
      orderValidationStatus: status,
    ));
  }

  void fetchActivities() async {
    if (state.hasReachedMax) {
      emit(state);
      return;
    }
    if (state.status == CurrentListStatus.initial && fetching) {
      final activities = await getOrders(0, state.orderValidationStatus);
      emit(state.copyWith(
        currentStatus: CurrentListStatus.success,
        loadedOrder: activities,
        hasReachedMax: false,
      ));
      return;
    }
    if (fetching) return;
    final activities = await getOrders(page, state.orderValidationStatus);
    if (activities == null || activities.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
        currentStatus: CurrentListStatus.success,
        loadedOrder: List.of(state.loadedOrder)..addAll(activities),
        hasReachedMax: false,
      ));
      page++;
    }
  }

  // String _mapHtmlContentToString(String htmlString) {
  //   if(htmlString == null) return '';
  //
  //   final document = parse(htmlString);
  //   htmlString = parse(document.body.text).documentElement.text;
  //
  //   return htmlString;
  // }
  //
  // Future<List<Activity>> _fetchActivities(int page) async {
  //   fetching = true;
  //   return _activitiesRepository
  //       .getActivities(page)
  //       .then((activities) {
  //     activities.forEach((activity) => activity.message = _mapHtmlContentToString(activity.content));
  //     return activities;
  //   })
  //       .whenComplete(() => fetching = false)
  //       .catchError((Object obj) {
  //     log.e(obj);
  //     fetching = false;
  //     emit(state.copyWith(status: ActivityStatus.failure));
  //   });
  // }

  getOrders(int page, String? status) {
    fetching = true;
    emit(state.copyWith(status: OrdersStatus.loading));
    _userRepository.getOrders(page, 7, status!).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      if (orders.payload?.length == null || orders.payload!.isEmpty) {
        emit(state.copyWith(status: OrdersStatus.listIsEmpty));
      }
    }).catchError((Object obj) {
      fetching = false;
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(status: OrdersStatus.error));
      }
    });
  }
}