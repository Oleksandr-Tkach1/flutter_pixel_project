import 'Images.dart';
import 'User.dart';
import 'Dealer.dart';
import 'DeviceData.dart';
import 'Backdrop.dart';
import 'QaDetails.dart';

class Payload {
  Payload({
      this.id, 
      this.videoGenerated, 
      this.b2c, 
      this.sendToAiTimes, 
      this.isDemo, 
      this.photoType, 
      this.hasRejectedImages, 
      this.birthType, 
      this.checkOrderBeforeProgress, 
      this.images, 
      this.name, 
      this.price, 
      this.ratio, 
      this.status, 
      this.template, 
      this.templateName, 
      this.templateType, 
      this.user, 
      this.dealer, 
      this.becycle, 
      this.skeletonType, 
      this.deviceData, 
      this.processingType, 
      this.backdrop, 
      this.orderId, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.priorityAi, 
      this.submitTime, 
      this.hasPng, 
      this.qaDetails, 
      this.deliveredTime, 
      this.isNewest, 
      this.percentage,});

  Payload.fromJson(dynamic json) {
    id = json['_id'];
    videoGenerated = json['videoGenerated'];
    b2c = json['b2c'];
    sendToAiTimes = json['sendToAiTimes'];
    isDemo = json['isDemo'];
    photoType = json['photoType'];
    hasRejectedImages = json['hasRejectedImages'];
    birthType = json['birthType'];
    checkOrderBeforeProgress = json['checkOrderBeforeProgress'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    name = json['name'];
    price = json['price'];
    ratio = json['ratio'];
    status = json['status'];
    template = json['template'];
    templateName = json['templateName'];
    templateType = json['templateType'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    dealer = json['dealer'] != null ? Dealer.fromJson(json['dealer']) : null;
    becycle = json['becycle'];
    skeletonType = json['skeletonType'];
    deviceData = json['deviceData'] != null ? DeviceData.fromJson(json['deviceData']) : null;
    processingType = json['processingType'];
    backdrop = json['backdrop'] != null ? Backdrop.fromJson(json['backdrop']) : null;
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    priorityAi = json['priorityAi'];
    submitTime = json['submitTime'];
    hasPng = json['hasPng'];
    qaDetails = json['qaDetails'] != null ? QaDetails.fromJson(json['qaDetails']) : null;
    deliveredTime = json['deliveredTime'];
    isNewest = json['isNewest'];
    percentage = json['percentage'];
  }
  String? id;
  bool? videoGenerated;
  bool? b2c;
  int? sendToAiTimes;
  bool? isDemo;
  String? photoType;
  bool? hasRejectedImages;
  String? birthType;
  bool? checkOrderBeforeProgress;
  List<Images>? images;
  String? name;
  int? price;
  String? ratio;
  String? status;
  String? template;
  String? templateName;
  String? templateType;
  User? user;
  Dealer? dealer;
  String? becycle;
  String? skeletonType;
  DeviceData? deviceData;
  String? processingType;
  Backdrop? backdrop;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? priorityAi;
  String? submitTime;
  bool? hasPng;
  QaDetails? qaDetails;
  String? deliveredTime;
  bool? isNewest;
  int? percentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['videoGenerated'] = videoGenerated;
    map['b2c'] = b2c;
    map['sendToAiTimes'] = sendToAiTimes;
    map['isDemo'] = isDemo;
    map['photoType'] = photoType;
    map['hasRejectedImages'] = hasRejectedImages;
    map['birthType'] = birthType;
    map['checkOrderBeforeProgress'] = checkOrderBeforeProgress;
    if (images != null) {
      map['images'] = images!.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['price'] = price;
    map['ratio'] = ratio;
    map['status'] = status;
    map['template'] = template;
    map['templateName'] = templateName;
    map['templateType'] = templateType;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (dealer != null) {
      map['dealer'] = dealer!.toJson();
    }
    map['becycle'] = becycle;
    map['skeletonType'] = skeletonType;
    if (deviceData != null) {
      map['deviceData'] = deviceData!.toJson();
    }
    map['processingType'] = processingType;
    if (backdrop != null) {
      map['backdrop'] = backdrop!.toJson();
    }
    map['orderId'] = orderId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['priorityAi'] = priorityAi;
    map['submitTime'] = submitTime;
    map['hasPng'] = hasPng;
    if (qaDetails != null) {
      map['qaDetails'] = qaDetails!.toJson();
    }
    map['deliveredTime'] = deliveredTime;
    map['isNewest'] = isNewest;
    map['percentage'] = percentage;
    return map;
  }

}