class ProductImage {
  ProductImage({
      this.id, 
      this.skeleton, 
      this.image, 
      this.outline, 
      this.imageSequenceNumber, 
      this.isSpecial, 
      this.imageNumber, 
      this.imageType, 
      this.imageProcessingType, 
      this.imageTemplateType,});

  ProductImage.fromJson(dynamic json) {
    id = json['_id'];
    skeleton = json['skeleton'];
    image = json['image'];
    outline = json['outline'];
    imageSequenceNumber = json['imageSequenceNumber'];
    isSpecial = json['isSpecial'];
    imageNumber = json['imageNumber'];
    imageType = json['imageType'];
    imageProcessingType = json['imageProcessingType'];
    imageTemplateType = json['imageTemplateType'];
  }
  String? id;
  String? skeleton;
  String? image;
  String? outline;
  int? imageSequenceNumber;
  bool? isSpecial;
  int? imageNumber;
  String? imageType;
  String? imageProcessingType;
  String? imageTemplateType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['skeleton'] = skeleton;
    map['image'] = image;
    map['outline'] = outline;
    map['imageSequenceNumber'] = imageSequenceNumber;
    map['isSpecial'] = isSpecial;
    map['imageNumber'] = imageNumber;
    map['imageType'] = imageType;
    map['imageProcessingType'] = imageProcessingType;
    map['imageTemplateType'] = imageTemplateType;
    return map;
  }
}