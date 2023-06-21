class Address {
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
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['addressLine'] = addressLine;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pinCode'] = pinCode;
    data['lat'] = lat;
    data['lng'] = lng;

    return data;
  }
}
