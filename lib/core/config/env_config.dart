import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  String get baseUrl => dotenv.get('API_BASE_URL');
  int get connectTimeout => dotenv.getInt('CONNECTION_TIME_OUT');
}
