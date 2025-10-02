import 'package:reading_api_data/data/models/user/geolocation_model.dart';
import 'package:reading_api_data/domain/entities/user_entities/geolocation.dart';

class GeolocationMapper {
  static GeolocationModel fromMap(Map<String, dynamic> map) {
    return GeolocationModel(lat: map['lat'], long: map['long']);
  }

  static Map<String, dynamic> toMap(GeolocationModel model) {
    return {'lat': model.lat, 'long': model.long};
  }

  static Geolocation toEntity(GeolocationModel model) {
    return Geolocation(lat: model.lat, long: model.long);
  }
}
