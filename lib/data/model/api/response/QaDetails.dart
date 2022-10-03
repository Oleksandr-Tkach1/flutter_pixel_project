class QaDetails {
  String? startTime;

  QaDetails({this.startTime});

  QaDetails.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startTime;
    return data;
  }
}