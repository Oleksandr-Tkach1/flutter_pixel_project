class DeviceData {
  DeviceData({
      this.brand, 
      this.deviceId, 
      this.api, 
      this.modelDevice, 
      this.resolution, 
      this.version, 
      this.buildNumber, 
      this.platForm,});

  DeviceData.fromJson(dynamic json) {
    brand = json['brand'];
    deviceId = json['deviceId'];
    api = json['api'];
    modelDevice = json['modelDevice'];
    resolution = json['resolution'];
    version = json['version'];
    buildNumber = json['buildNumber'];
    platForm = json['platForm'];
  }
  String? brand;
  String? deviceId;
  String? api;
  String? modelDevice;
  String? resolution;
  String? version;
  String? buildNumber;
  String? platForm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand'] = brand;
    map['deviceId'] = deviceId;
    map['api'] = api;
    map['modelDevice'] = modelDevice;
    map['resolution'] = resolution;
    map['version'] = version;
    map['buildNumber'] = buildNumber;
    map['platForm'] = platForm;
    return map;
  }
}