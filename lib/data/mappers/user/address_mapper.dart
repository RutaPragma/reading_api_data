import 'package:reading_api_data/data/mappers/user/geolocation_mapper.dart';
import 'package:reading_api_data/data/models/user/address_model.dart';
import 'package:reading_api_data/domain/entities/user_entities/address.dart';

class AddressMapper {
  static AddressModel fromMap(Map<String, dynamic> map) {
    return AddressModel(
      geolocation: GeolocationMapper.fromMap(map['geolocation']),
      city: map['city'],
      street: map['street'],
      number: map['number'],
      zipcode: map['zipcode'],
    );
  }

  static Map<String, dynamic> toMap(AddressModel model) {
    return {
      'geolocation': GeolocationMapper.toMap(model.geolocation),
      'city': model.city,
      'street': model.street,
      'number': model.number,
      'zipcode': model.zipcode,
    };
  }

  static Address toEntity(AddressModel model) {
    return Address(
      geolocation: GeolocationMapper.toEntity(model.geolocation),
      city: model.city,
      street: model.street,
      number: model.number,
      zipcode: model.zipcode,
    );
  }
}
