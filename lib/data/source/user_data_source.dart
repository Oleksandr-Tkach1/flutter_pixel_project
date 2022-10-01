import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/model/api/response/Access.dart';

abstract class UserDataSource {
  Future<String?> getAccessToken();
  AccessToken saveAccessToken(AccessToken response);
  void removeAccessData();

  Future<OrdersResponse> getOrders(String status);
}