class Data {
  Data({
      this.id, 
      this.email, 
      this.role, 
      this.active, 
      this.firstName, 
      this.lastName,
      this.ordersLimit, 
      this.isPro, 
      this.priceNCut, 
      this.priceCCut, 
      this.priceCCutMoto, 
      this.priceClear, 
      this.priceAi, 
      this.pricePhoto, 
      this.online, 
      this.device, 
      this.lang,
 });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    role = json['role'];
    active = json['active'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    ordersLimit = json['ordersLimit'];
    isPro = json['isPro'];
    priceNCut = json['priceNCut'];
    priceCCut = json['priceCCut'];
    priceCCutMoto = json['priceCCutMoto'];
    priceClear = json['priceClear'];
    priceAi = json['priceAi'];
    pricePhoto = json['pricePhoto'];
    online = json['online'];
    device = json['device'];
    lang = json['lang'];
  }
  String? id;
  String? email;
  String? role;
  bool? active;
  String? firstName;
  String? lastName;
  int? ordersLimit;
  bool? isPro;
  double? priceNCut;
  double? priceCCut;
  double? priceCCutMoto;
  int? priceClear;
  double? priceAi;
  double? pricePhoto;
  int? online;
  String? device;
  String? lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['role'] = role;
    map['active'] = active;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['ordersLimit'] = ordersLimit;
    map['isPro'] = isPro;
    map['priceNCut'] = priceNCut;
    map['priceCCut'] = priceCCut;
    map['priceCCutMoto'] = priceCCutMoto;
    map['priceClear'] = priceClear;
    map['priceAi'] = priceAi;
    map['pricePhoto'] = pricePhoto;
    map['online'] = online;
    map['device'] = device;
    map['lang'] = lang;
    return map;
  }
}