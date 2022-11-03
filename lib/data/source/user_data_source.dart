import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/model/api/response/Access.dart';
import 'package:flutter_pixel_project/data/model/order_details/OrderDetails.dart';

abstract class UserDataSource {
  Future<String?> getAccessToken();
  AccessToken saveAccessToken(AccessToken response);
  void removeAccessData();

  Future<OrdersResponse> getOrders(int offset, String status);

  Future<OrdersResponse> getOrdersArchive(int offset);

  Future<OrderDetails> getOrderDetails(String id);
}