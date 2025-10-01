import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reading_api_data/core/config/env_config.dart';

class AppConfig {
  static Future<void> initialize() async {
    await dotenv.load();
  }

  static EnvConfig envConfig = EnvConfig();
}
