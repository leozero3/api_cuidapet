import './i_logger.dart';
import 'package:logger/logger.dart' as log;

class Logger implements ILogger {
  final _logger = log.Logger();

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    return _logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    return _logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    return _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warning(message, [error, StackTrace? stackTrace]) {
    return _logger.w(message, error: error, stackTrace: stackTrace);
  }
}
