import 'dart:async';

import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_logging/hrk_logging.dart';
import 'package:test/test.dart';

void main() {
  final String name = 'HrkLogger';

  group('HrkLogging Test', () {
    test('HrkLevel', () {
      HrkLevel.LEVELS.contains(HrkLevel.DEBUG);
    });

    test('Print log', () {
      configureHrkLogging();
      final log = Logger(name)..level = Level.ALL;
      log.shout('sample shout');
      log.severe('sample severe');
      log.warning('sample warning');
      log.info('sample info');
      log.config('sample config');
      log.debug('sample debug');
      log.fine('sample fine');
      log.finer('sample finer');
      log.finest('sample finest');
      Logger.root.clearListeners();
    });

    test('Assert log', () async {
      Level level = Level.SHOUT;
      String message = 'sample ${level.toString().toLowerCase()}';
      RegExp pattern = RegExp('^$name: '
          '${RegExp.escape('${AnsiColor.red}${Emoji.shout}')} '
          '${level.toString().capitalize()}: .*'
          '$message'
          '${RegExp.escape(AnsiColor.reset)}\$');
      await verifyLog(name, level, message, pattern);

      level = Level.SEVERE;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${RegExp.escape('${AnsiColor.red}${Emoji.severe}')} '
          '${level.toString().capitalize()}: .*'
          '$message'
          '${RegExp.escape(AnsiColor.reset)}\$');
      await verifyLog(name, level, message, pattern);

      level = Level.WARNING;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${RegExp.escape('${AnsiColor.yellow}${Emoji.warning}')} '
          '${level.toString().capitalize()}: .*'
          '$message'
          '${RegExp.escape(AnsiColor.reset)}\$');
      await verifyLog(name, level, message, pattern);

      level = Level.INFO;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${RegExp.escape('${AnsiColor.green}${Emoji.info}')} '
          '${level.toString().capitalize()}: .*'
          '$message'
          '${RegExp.escape(AnsiColor.reset)}\$');
      await verifyLog(name, level, message, pattern);

      level = Level.CONFIG;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${level.toString().capitalize()}: .*'
          '$message\$');
      await verifyLog(name, level, message, pattern);

      level = HrkLevel.DEBUG;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${RegExp.escape('${AnsiColor.blue}${Emoji.debug}')} '
          '${level.toString().capitalize()}: .*'
          '$message'
          '${RegExp.escape(AnsiColor.reset)}\$');
      await verifyLog(name, level, message, pattern);

      level = Level.FINE;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${level.toString().capitalize()}: .*'
          '$message\$');
      await verifyLog(name, level, message, pattern);

      level = Level.FINER;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${level.toString().capitalize()}: .*'
          '$message\$');
      await verifyLog(name, level, message, pattern);

      level = Level.FINEST;
      message = 'sample ${level.toString().toLowerCase()}';
      pattern = RegExp('^$name: '
          '${level.toString().capitalize()}: .*'
          '$message\$');
      await verifyLog(name, level, message, pattern);
    });
  });
}

Future<void> verifyLog(
  String name,
  Level level,
  String message,
  RegExp pattern,
) async {
  await runZoned(
    () async {
      configureHrkLogging();
      final log = Logger(name)..level = level;
      log.log(level, message);
      Logger.root.clearListeners();
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        expect(true, pattern.hasMatch(line));
      },
    ),
  );
}
