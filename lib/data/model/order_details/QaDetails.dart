class QaDetails {
  QaDetails({
      this.qa, 
      this.startTime,});

  QaDetails.fromJson(dynamic json) {
    qa = json['qa'];
    startTime = json['startTime'];
  }
  String? qa;
  String? startTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qa'] = qa;
    map['startTime'] = startTime;
    return map;
  }
}