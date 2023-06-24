class AddressModel {
  int? id;
  int? userId;
  Address? address;
  String? addressLabel;
  String? contact;
  String? category;
  String? district;
  String? locality;
  String? latitude;
  String? longitude;

  AddressModel(
      {this.id,
        this.userId,
        this.address,
        this.addressLabel,
        this.contact,
        this.category,
        this.district,
        this.locality,
        this.latitude,
        this.longitude});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    addressLabel = json['address_label'];
    contact = json['contact'];
    category = json['category'];
    district = json['district'];
    locality = json['locality'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['address_label'] = this.addressLabel;
    data['contact'] = this.contact;
    data['category'] = this.category;
    data['district'] = this.district;
    data['locality'] = this.locality;
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