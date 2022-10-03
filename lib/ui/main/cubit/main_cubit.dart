import 'package:bloc/bloc.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/Order.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/repositories/user_repository.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:dio/dio.dart';

class MainCubit extends Cubit<OrdersState> {
  final UserRepository _userRepository;
  String currentStatus = 'PEDNING_APPROVAL'; // это дефотный статус который мы
  // хотим отобразить при старте апки когда еще юзер ничего сам не выбрал
  int page = 1;
  bool fetching = false;

  MainCubit(this._userRepository) : super(const OrdersState());

  setCurrentStatus(String status) {
    currentStatus = status; //Запоминаем  тот статус который ввел юзер
    // и передал в этот метод при клике в менюшке
  }

  // void fetchActivities() async {
  //   if (state.hasReachedMax) {
  //     emit(state);
  //     return;
  //   }
  //   if (state.status == CurrentListStatus.initial && fetching) {
  //     final activities = await _fetchActivities(0);
  //     emit(state.copyWith(
  //       currentStatus: CurrentListStatus.success,
  //       loadedOrder: activities,
  //       hasReachedMax: false,
  //     ));
  //     return;
  //   }
  //   if (fetching) return;
  //   final activities = await _fetchActivities(page);
  //   if (activities == null || activities.isEmpty) {
  //     emit(state.copyWith(hasReachedMax: true));
  //   } else {
  //     emit(state.copyWith(
  //       currentStatus: CurrentListStatus.success,
  //       loadedOrder: List.of(state.loadedOrder)..addAll(activities),
  //       hasReachedMax: false,
  //     ));
  //     page++;
  //   }
  // }
  //
  // String _mapHtmlContentToString(String htmlString) {
  //   if(htmlString == null) return '';
  //   final document = parse(htmlString);
  //   htmlString = parse(document.body.text).documentElement.text;
  //
  //   return htmlString;
  // }
  //
  // Future<Future<OrdersResponse>> _fetchActivities(String status, int page) async {
  //   fetching = true;
  //   return _userRepository.getOrders(status, page).then((activities) {
  //     activities.forEach((activity) => activity.message = _mapHtmlContentToString(activity.content));
  //     return activities;
  //   }).whenComplete(() => fetching = false).catchError((Object obj) {
  //     log.e(obj);
  //     fetching = false;
  //     emit(state.copyWith(currentStatus: CurrentListStatus.failure));
  //   });
  // }

  getOrders(String status) {
    fetching = true;
    emit(state.copyWith(status: OrdersStatus.loading));
    _userRepository.getOrders(7, status).then((orders) {
      emit(state.copyWith(
        status: OrdersStatus.complete,
        ordersCount: orders.payload?.length,
        loadedOrder: orders.payload,
      ));
      if (orders.payload?.length == null || orders.payload!.isEmpty) {
        emit(state.copyWith(status: OrdersStatus.listIsEmpty));
      }
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          emit(state.copyWith(status: OrdersStatus.error));
      }
    });
  }
}
