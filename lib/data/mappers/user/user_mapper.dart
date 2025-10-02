
import 'package:reading_api_data/data/mappers/user/user.dart';
import 'package:reading_api_data/data/models/user/user_model.dart';
import 'package:reading_api_data/domain/entities/user_entities/user.dart';

class UserMapper {
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: AddressMapper.fromMap(map['address']),
      id: map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'],
      name: NameMapper.fromMap(map['name']),
      phone: map['phone']// revisa si en la API viene como `__v`
    );
  }

  static Map<String, dynamic> toMap(UserModel model) {
    return {
      'address': AddressMapper.toMap(model.address),
      'id': model.id,
      'email': model.email,
      'username': model.username,
      'password': model.password,
      'name': NameMapper.toMap(model.name),
      'phone': model.phone,
    };
  }

  static User toEntity(UserModel model) {
    return User(
      address: AddressMapper.toEntity(model.address),
      id: model.id,
      email: model.email,
      username: model.username,
      password: model.password,
      name: NameMapper.toEntity(model.name),
      phone: model.phone,
    );
  }
}
