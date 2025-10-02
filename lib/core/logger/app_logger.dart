import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(printer: CustomPrettyPrinter());

  static void info(String message) => _logger.i(message);

  static void warn(String message) => _logger.w(message);

  static void error(String message, [dynamic error, StackTrace? stack]) =>
      _logger.e(message, error: error, stackTrace: stack);

  static void debug(String message) => _logger.d(message);

  static void success(String message, [String? title, StackTrace? stack]) =>
      _logger.f(message, error: title, stackTrace: stack);
}

class CustomPrettyPrinter extends PrettyPrinter {
  CustomPrettyPrinter()
    : super(
        methodCount: 0,
        errorMethodCount: 5,
        colors: false,
        lineLength: 150,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      );

  @override
  List<String> log(LogEvent event) {
    final buffer = super.log(event);

    if (event.stackTrace != null) {
      buffer.add('--- FIN DEL BLOQUE ---');
    }

    return buffer;
  }
}
