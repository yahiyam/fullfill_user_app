class Address {
  String? id;
  String? name;
  String? phoneNumber;
  String? addressLine;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  double? lat;
  double? lng;

  Address({
    this.id,
    this.name,
    this.phoneNumber,
    this.addressLine,
    this.city,
    this.state,
    this.country,
    this.pinCode,
    this.lat,
    this.lng,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    addressLine = json['addressLine'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pinCode = json['pinCode'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['addressLine'] = addressLine;
    data['country'] = country;
    data['pinCode'] = pinCode;
    data['lat'] = lat;
    data['lng'] = lng;

    return data;
  }
}
