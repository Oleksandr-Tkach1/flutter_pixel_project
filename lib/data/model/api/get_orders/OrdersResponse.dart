import 'Order.dart';

class OrdersResponse {
  OrdersResponse({
      this.code, 
      this.payload,
  });

  OrdersResponse.fromJson(dynamic json) {
    code = json['code'];
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload?.add(Order.fromJson(v));
      });
    }
  }
  int? code;
  List<Order>? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (payload != null) {
      map['payload'] = payload?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}