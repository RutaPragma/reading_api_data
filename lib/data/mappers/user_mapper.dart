import 'package:lectura_datos_api/data/models/user_model.dart';
import 'package:lectura_datos_api/domain/entities/user.dart';

class UserMapper {
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      phone: map['phone'],
    );
  }

  static Map<String, dynamic> toMap(UserModel model) {
    return {
      'id': model.id,
      'email': model.email,
      'username': model.username,
      'phone': model.phone,
    };
  }

  static User toEntity(UserModel model) {
    return User(
      id: model.id,
      email: model.email,
      username: model.username,
      phone: model.phone,
    );
  }
}
