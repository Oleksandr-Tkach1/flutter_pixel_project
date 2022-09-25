class AccessToken {
  AccessToken({
      this.expires, 
      this.token,});

  AccessToken.fromJson(dynamic json) {
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