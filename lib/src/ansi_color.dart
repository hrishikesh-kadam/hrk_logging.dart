/// Sources:
///   - https://github.com/flutter/flutter/blob/master/packages/flutter_tools/lib/src/base/terminal.dart
///   - https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
class AnsiColor {
  static const String red = '\u001b[31m';
  static const String green = '\u001b[32m';
  static const String yellow = '\u001b[33m';
  static const String blue = '\u001b[34m';
  static const String magenta = '\u001b[35m';
  static const String brightRed = '\u001b[91m';
  static const String reset = '\u001B[39m';
}
