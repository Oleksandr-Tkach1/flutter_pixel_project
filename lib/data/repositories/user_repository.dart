import 'package:flutter_pixel_project/data/app_data.dart';
import 'package:flutter_pixel_project/data/model/api/get_orders/OrdersResponse.dart';
import 'package:flutter_pixel_project/data/model/api/response/Access.dart';
import 'package:flutter_pixel_project/data/model/order_details/OrderDetails.dart';
import 'package:flutter_pixel_project/data/source/user_data_source.dart';
import 'package:flutter_pixel_project/network/server_api.dart';

class UserRepository extends UserDataSource {
  final RestClient client;

  UserRepository(this.client);

  @override
  Future<String?> getAccessToken() async {
    return AppData.instance.getAccessToken();
  }

  @override
  AccessToken saveAccessToken(AccessToken response) {
    AppData.instance.saveAccessToken(response);
    return response;
  }
  // Future<String?> getUserId() async {
  //   return AppData.instance.getUserId();
  // }
  //
  @override
  void removeAccessData() {
    AppData.instance.clearAccessData();
  }

  @override
  Future<OrdersResponse> getOrders(int page, String status) {
    return client.getOrders(page, 10, status);
  }

  @override
  Future<OrderDetails> getOrderDetails(String id) {
    return client.getOrderDetails(id);
  }
}