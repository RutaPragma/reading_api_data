import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  String get baseUrl => dotenv.env['API_BASE_URL'] ?? '';
}
