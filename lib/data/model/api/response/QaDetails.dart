import 'package:flutter_pixel_project/data/model/api/response/Qa.dart';

class QaDetails {
  Qa? qa;
  String? startTime;

  QaDetails({this.qa, this.startTime});

  QaDetails.fromJson(Map<String, dynamic> json) {
    qa = json['qa'] != null ? Qa.fromJson(json['qa']) : null;
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (qa != null) {
      data['qa'] = qa!.toJson();
    }
    data['startTime'] = startTime;
    return data;
  }
}