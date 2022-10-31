import 'Qa.dart';

class QaDetails {
  QaDetails({
      this.qa, 
      this.startTime,});

  QaDetails.fromJson(dynamic json) {
    qa = json['qa'] != null ? Qa.fromJson(json['qa']) : null;
    startTime = json['startTime'];
  }
  Qa? qa;
  String? startTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (qa != null) {
      map['qa'] = qa!.toJson();
    }
    map['startTime'] = startTime;
    return map;
  }

}