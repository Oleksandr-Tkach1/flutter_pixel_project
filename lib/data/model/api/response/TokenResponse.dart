import 'Payload.dart';

class TokenResponse {
  TokenResponse({
      this.code, 
      this.message, 
      this.payload,});

  TokenResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  int? code;
  String? message;
  Payload? payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (payload != null) {
      map['payload'] = payload?.toJson();
    }
    return map;
  }
}