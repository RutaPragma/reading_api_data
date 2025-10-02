import 'package:reading_api_data/domain/entities/user_entities/user_entities.dart';

class User {
  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;

  User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  @override
  String toString() {
    super.toString();
    return '''

  {
    "id": $id,
    "address": $address,
    "email": "$email",
    "username": "$username",
    "password": "$password",
    "name": $name,
    "phone": "$phone"
  }''';
  }
}
