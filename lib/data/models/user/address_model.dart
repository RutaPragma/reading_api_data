import 'package:reading_api_data/data/models/user/geolocation_model.dart';

class AddressModel {
  GeolocationModel geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  AddressModel({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
}
