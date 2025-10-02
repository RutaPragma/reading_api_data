import 'package:reading_api_data/domain/entities/user_entities/geolocation.dart';

class Address {
  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
  @override
  String toString() {
    super.toString();
    return '''{
      "geolocation": $geolocation,
      "city": "$city",
      "street": "$street",
      "number": $number,
      "zipcode": "$zipcode",
    }''';
  }
}
