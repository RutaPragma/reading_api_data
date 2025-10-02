import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      colors: false,
      lineLength: 150,
      // printEmojis: false,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  static void info(String message) => _logger.i(message);
  static void warn(String message) => _logger.w(message);
  static void error(String message, [dynamic error, StackTrace? stack]) =>
      _logger.e(message, error: error, stackTrace: stack);
  static void debug(String message) => _logger.d(message);
  static void success(String message) => _logger.f(message);
}
