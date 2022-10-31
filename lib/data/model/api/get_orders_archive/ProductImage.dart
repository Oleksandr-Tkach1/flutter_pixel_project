class ProductImage {
  ProductImage({
      this.id, 
      this.skeleton, 
      this.image, 
      this.outline, 
      this.imageSequenceNumber, 
      this.imageProcessingType, 
      this.isSpecial, 
      this.imageNumber, 
      this.imageTemplateType, 
      this.imageType,});

  ProductImage.fromJson(dynamic json) {
    id = json['_id'];
    skeleton = json['skeleton'];
    image = json['image'];
    outline = json['outline'];
    imageSequenceNumber = json['imageSequenceNumber'];
    imageProcessingType = json['imageProcessingType'];
    isSpecial = json['isSpecial'];
    imageNumber = json['imageNumber'];
    imageTemplateType = json['imageTemplateType'];
    imageType = json['imageType'];
  }
  String? id;
  String? skeleton;
  String? image;
  String? outline;
  int? imageSequenceNumber;
  String? imageProcessingType;
  bool? isSpecial;
  int? imageNumber;
  String? imageTemplateType;
  String? imageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['skeleton'] = skeleton;
    map['image'] = image;
    map['outline'] = outline;
    map['imageSequenceNumber'] = imageSequenceNumber;
    map['imageProcessingType'] = imageProcessingType;
    map['isSpecial'] = isSpecial;
    map['imageNumber'] = imageNumber;
    map['imageTemplateType'] = imageTemplateType;
    map['imageType'] = imageType;
    return map;
  }
}