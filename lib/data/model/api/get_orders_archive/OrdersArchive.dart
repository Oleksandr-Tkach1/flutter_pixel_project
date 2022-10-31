import 'Payload.dart';

class OrdersArchive {
  OrdersArchive({
      this.code, 
      this.payload,});

  OrdersArchive.fromJson(dynamic json) {
    code = json['code'];
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
  }
  int? code;
  List<Payload>? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (payload != null) {
      map['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}