import 'package:flutter_pixel_project/data/model/api/response/QaDetails.dart';

import 'Access.dart';
import 'Refresh.dart';
import 'Data.dart';

class Payload {
  Payload({
    this.access,
    this.refresh,
    this.data,
    this.qaDetails,
  });

  Payload.fromJson(dynamic json) {
    access = json['access'] != null ? AccessToken.fromJson(json['access']) : null;
    refresh = json['refresh'] != null ? Refresh.fromJson(json['refresh']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    qaDetails = json['qaDetails'] != null
        ? QaDetails.fromJson(json['qaDetails'])
        : null;
  }
  AccessToken? access;
  Refresh? refresh;
  Data? data;
  QaDetails? qaDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (access != null) {
      map['access'] = access?.toJson();
    }
    final refresh = this.refresh;
    if (refresh != null) {
      map['refresh'] = refresh.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (qaDetails != null) {
      map['qaDetails'] = qaDetails!.toJson();
    }
    return map;
  }
}