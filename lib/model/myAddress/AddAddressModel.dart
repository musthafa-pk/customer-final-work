class AddAddressModel {
  Address? address;
  String? district;
  String? locality;
  String? addressLabel;
  String? contact;
  String? category;
  String? latitude;
  String? longitude;

  AddAddressModel(
      {this.address,
        this.district,
        this.locality,
        this.addressLabel,
        this.contact,
        this.category,
        this.latitude,
        this.longitude});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    district = json['district'];
    locality = json['locality'];
    addressLabel = json['address_label'];
    contact = json['contact'];
    category = json['category'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['district'] = this.district;
    data['locality'] = this.locality;
    data['address_label'] = this.addressLabel;
    data['contact'] = this.contact;
    data['category'] = this.category;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Address {
  String? building;
  String? place;
  String? pin;

  Address({this.building, this.place, this.pin});

  Address.fromJson(Map<String, dynamic> json) {
    building = json['building'];
    place = json['place'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['building'] = this.building;
    data['place'] = this.place;
    data['pin'] = this.pin;
    return data;
  }
}