import 'Payload.dart';

class OrderDetails {
  OrderDetails({
      this.code, 
      this.payload,});

  OrderDetails.fromJson(dynamic json) {
    code = json['code'];
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  int? code;
  Payload? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }

}