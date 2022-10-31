class Backdrop {
  Backdrop({
      this.id, 
      this.backdropNumber, 
      this.image,});

  Backdrop.fromJson(dynamic json) {
    id = json['_id'];
    backdropNumber = json['backdropNumber'];
    image = json['image'];
  }
  String? id;
  int? backdropNumber;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['backdropNumber'] = backdropNumber;
    map['image'] = image;
    return map;
  }
}