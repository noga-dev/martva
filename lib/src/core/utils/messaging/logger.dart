// ignore: unused_import
import 'dart:developer';
import 'dart:io' as io;

import 'package:logger/logger.dart';

final logger = Logger(
  level: Level.trace,
  printer: PrettyPrinter(
    dateTimeFormat: (time) => time.toString(),
    colors: true,
    printEmojis: true,
  ),
  output: _StdOutput(),
);

class _StdOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    log('↙️⬇️↘️');
    if (event.origin.stackTrace != null) {
      io.stdout.write(event.origin.stackTrace);
    }
    if (event.origin.error != null) {
      log('├${event.origin.error}');
    }
    // for (final line in event.lines) {
    //   log('├$line');
    // }
    log('↖️⬆️↗️');
  }
}
