class Refresh {
  Refresh({
      this.expires, 
      this.token,});

  Refresh.fromJson(dynamic json) {
    expires = json['expires'];
    token = json['token'];
  }
  String? expires;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expires'] = expires;
    map['token'] = token;
    return map;
  }
}