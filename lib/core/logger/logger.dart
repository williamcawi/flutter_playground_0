import 'package:logger/logger.dart';

class MyLogger {
  static final Logger _logger = Logger();

  static Logger get instance => _logger;
}
