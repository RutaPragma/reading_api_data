import 'package:reading_api_data/data/models/user/user.dart';

class UserModel {
  AddressModel address;
  int id;
  String email;
  String username;
  String password;
  NameModel name;
  String phone;

  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });
}
