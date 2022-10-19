
import 'package:flutter_pixel_project/data/model/api/response/QaDetails.dart';

class Order {
  String? id;
  String? photoType;
  List<Images>? images;
  String? name;
  String? status;
  String? template;
  int? orderId;
  String? createdAt;
  String? updatedAt;
  User? user;
  QaDetails? qaDetails;

  Order(
      {this.id,
        this.photoType,
        this.images,
        this.name,
        this.status,
        this.template,
        this.orderId,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.qaDetails,
      });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    photoType = json['photoType'];
    name = json['name'];
    status = json['status'];
    template = json['template'];
    orderId = json['orderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    qaDetails = json['qaDetails'] != null
        ? QaDetails.fromJson(json['qaDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['template'] = template;
    data['orderId'] = orderId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (qaDetails != null) {
      data['qaDetails'] = qaDetails!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Images {
  String? compositedImage;
  String? designerImage;
  String? designerImagePNG;
  String? userImage;
  String? platForm;
  String? userScreenShot;

  Images(
      {this.compositedImage,
        this.designerImage,
        this.designerImagePNG,
        this.userImage,
        this.platForm,
        this.userScreenShot,
      });

  Images.fromJson(Map<String, dynamic> json) {
    compositedImage = json['compositedImage'];
    designerImage = json['designerImage'];
    designerImagePNG = json['designerImagePNG'];
    userImage = json['userImage'];
    platForm = json['platForm'];
    userScreenShot = json['userScreenShot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['compositedImage'] = compositedImage;
    data['designerImage'] = designerImage;
    data['designerImagePNG'] = designerImagePNG;
    data['userImage'] = userImage;
    data['platForm'] = platForm;
    data['userScreenShot'] = userScreenShot;
    return data;
  }
}