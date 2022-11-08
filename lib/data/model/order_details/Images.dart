import 'package:equatable/equatable.dart';

enum OrderStatus { accept, reject, sendToCustomer, none }

class Images extends Equatable {
  Images({
      this.hasThumb, 
      this.isAlreadyPrepaid, 
      this.isDoneManually, 
      this.isPaid, 
      this.isRejected, 
      this.prepaidCount, 
      this.rejectJpg, 
      this.rejectPng, 
      this.compositedImage, 
      this.designerImage, 
      this.designerImagePNG, 
      this.userImage,
      this.aiCompositedImage, 
      this.aiImage,});

  @override
  List<Object?> get props => [status, visibilityComment];

  Images.fromJson(dynamic json) {
    hasThumb = json['hasThumb'];
    isAlreadyPrepaid = json['isAlreadyPrepaid'];
    isDoneManually = json['isDoneManually'];
    isPaid = json['isPaid'];
    isRejected = json['isRejected'];
    prepaidCount = json['prepaidCount'];
    rejectJpg = json['rejectJpg'];
    rejectPng = json['rejectPng'];
    compositedImage = json['compositedImage'];
    designerImage = json['designerImage'];
    designerImagePNG = json['designerImagePNG'];
    userImage = json['userImage'];
    aiCompositedImage = json['aiCompositedImage'];
    aiImage = json['aiImage'];
  }
  bool? hasThumb;
  bool? isAlreadyPrepaid;
  bool? isDoneManually;
  bool? isPaid;
  bool? isRejected;
  int? prepaidCount;
  bool? rejectJpg;
  bool? rejectPng;
  String? compositedImage;
  String? designerImage;
  String? designerImagePNG;
  String? userImage;
  String? aiCompositedImage;
  String? aiImage;
  /// this is local ui value
  OrderStatus status = OrderStatus.none;
  bool visibilityComment = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hasThumb'] = hasThumb;
    map['isAlreadyPrepaid'] = isAlreadyPrepaid;
    map['isDoneManually'] = isDoneManually;
    map['isPaid'] = isPaid;
    map['isRejected'] = isRejected;
    map['prepaidCount'] = prepaidCount;
    map['rejectJpg'] = rejectJpg;
    map['rejectPng'] = rejectPng;
    map['compositedImage'] = compositedImage;
    map['designerImage'] = designerImage;
    map['designerImagePNG'] = designerImagePNG;
    map['userImage'] = userImage;
    map['aiCompositedImage'] = aiCompositedImage;
    map['aiImage'] = aiImage;
    return map;
  }
}