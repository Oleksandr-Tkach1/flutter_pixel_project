import 'DesignerDetails.dart';
import 'Images.dart';
import 'QaDetails.dart';

class Payload {
  Payload({
      this.id, 
      this.b2c, 
      this.dealer,
      this.deliveredTime, 
      this.designerDetails, 
      this.hasPng, 
      this.hasRejectedImages, 
      this.images, 
      this.isDemo, 
      this.isNewest, 
      this.name, 
      this.orderId, 
      this.photoType, 
      this.platForm, 
      this.price, 
      this.priorityAi, 
      this.qaDetails, 
      this.ratio, 
      this.sendToAiTimes, 
      this.status, 
      this.submitTime, 
      this.template, 
      this.templateName, 
      this.templateType, 
      this.user, 
      this.videoGenerated, 
      this.createdAt, 
      this.imageBaseUrl, 
      this.updatedAt,
  });

  Payload.fromJson(dynamic json) {
    id = json['_id'];
    b2c = json['b2c'];
    dealer = json['dealer'];
    deliveredTime = json['deliveredTime'];
    designerDetails = json['designerDetails'] != null ? DesignerDetails.fromJson(json['designerDetails']) : null;
    hasPng = json['hasPng'];
    hasRejectedImages = json['hasRejectedImages'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    isDemo = json['isDemo'];
    isNewest = json['isNewest'];
    name = json['name'];
    orderId = json['orderId'];
    photoType = json['photoType'];
    platForm = json['platForm'];
    price = json['price'];
    priorityAi = json['priorityAi'];
    qaDetails = json['qaDetails'] != null ? QaDetails.fromJson(json['qaDetails']) : null;
    ratio = json['ratio'];
    sendToAiTimes = json['sendToAiTimes'];
    status = json['status'];
    submitTime = json['submitTime'];
    template = json['template'];
    templateName = json['templateName'];
    templateType = json['templateType'];
    user = json['user'];
    videoGenerated = json['videoGenerated'];
    createdAt = json['createdAt'];
    imageBaseUrl = json['imageBaseUrl'];
    updatedAt = json['updatedAt'];
  }
  String? id;
  bool? b2c;
  String? dealer;
  String? deliveredTime;
  DesignerDetails? designerDetails;
  bool? hasPng;
  bool? hasRejectedImages;
  List<Images>? images;
  bool? isDemo;
  bool? isNewest;
  String? name;
  int? orderId;
  String? photoType;
  String? platForm;
  num? price;
  int? priorityAi;
  QaDetails? qaDetails;
  String? ratio;
  int? sendToAiTimes;
  String? status;
  String? submitTime;
  String? template;
  String? templateName;
  String? templateType;
  String? user;
  bool? videoGenerated;
  String? createdAt;
  String? imageBaseUrl;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['b2c'] = b2c;
    map['dealer'] = dealer;
    map['deliveredTime'] = deliveredTime;
    if (designerDetails != null) {
      map['designerDetails'] = designerDetails?.toJson();
    }
    map['hasPng'] = hasPng;
    map['hasRejectedImages'] = hasRejectedImages;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['isDemo'] = isDemo;
    map['isNewest'] = isNewest;
    map['name'] = name;
    map['orderId'] = orderId;
    map['photoType'] = photoType;
    map['platForm'] = platForm;
    map['price'] = price;
    map['priorityAi'] = priorityAi;
    if (qaDetails != null) {
      map['qaDetails'] = qaDetails?.toJson();
    }
    map['ratio'] = ratio;
    map['sendToAiTimes'] = sendToAiTimes;
    map['status'] = status;
    map['submitTime'] = submitTime;
    map['template'] = template;
    map['templateName'] = templateName;
    map['templateType'] = templateType;
    map['user'] = user;
    map['videoGenerated'] = videoGenerated;
    map['createdAt'] = createdAt;
    map['imageBaseUrl'] = imageBaseUrl;
    map['updatedAt'] = updatedAt;
    return map;
  }
}