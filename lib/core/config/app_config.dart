import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lectura_datos_api/core/config/env_config.dart';

class AppConfig {
  static Future<void> initialize() async {
    await dotenv.load();
  }

  static EnvConfig envConfig = EnvConfig();
}
