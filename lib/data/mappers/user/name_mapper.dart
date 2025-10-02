import 'package:reading_api_data/data/models/user/name_model.dart';
import 'package:reading_api_data/domain/entities/user_entities/name.dart';

class NameMapper {
  static NameModel fromMap(Map<String, dynamic> map) {
    return NameModel(firstname: map['firstname'], lastname: map['lastname']);
  }

  static Map<String, dynamic> toMap(NameModel model) {
    return {'firstname': model.firstname, 'lastname': model.lastname};
  }

  static Name toEntity(NameModel model) {
    return Name(firstname: model.firstname, lastname: model.lastname);
  }
}
