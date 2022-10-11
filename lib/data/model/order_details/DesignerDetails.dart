class DesignerDetails {
  DesignerDetails({
      this.designer, 
      this.startTime,});

  DesignerDetails.fromJson(dynamic json) {
    designer = json['designer'];
    startTime = json['startTime'];
  }
  String? designer;
  String? startTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['designer'] = designer;
    map['startTime'] = startTime;
    return map;
  }

}