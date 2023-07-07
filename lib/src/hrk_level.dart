// ignore_for_file: constant_identifier_names

import 'package:logging/logging.dart';

class HrkLevel {
  static const Level DEBUG = Level('DEBUG', 600);

  static const Level ERROR = Level('ERROR', 950);

  static const List<Level> LEVELS = [
    Level.ALL,
    Level.FINEST,
    Level.FINER,
    Level.FINE,
    HrkLevel.DEBUG,
    Level.CONFIG,
    Level.INFO,
    Level.WARNING,
    HrkLevel.ERROR,
    Level.SEVERE,
    Level.SHOUT,
    Level.OFF
  ];
}

extension HrkLogger on Logger {
  void debug(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(HrkLevel.DEBUG, message, error, stackTrace);

  void error(Object? message, [Object? error, StackTrace? stackTrace]) =>
      log(HrkLevel.ERROR, message, error, stackTrace);
}
