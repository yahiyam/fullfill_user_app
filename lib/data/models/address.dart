class Address {
  String? id;
  String? name;
  String? phoneNumber;
  String? addressLine;
  String? city;
  String? state;
  String? country;
  String? pinCode;

  Address({
    this.id,
    this.name,
    this.phoneNumber,
    this.addressLine,
    this.city,
    this.state,
    this.country,
    this.pinCode,
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['addressLine'] = addressLine;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pinCode'] = pinCode;

    return data;
  }
}
