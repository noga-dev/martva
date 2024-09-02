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
    log(event.lines.first);
    io.stdout.write(StackTrace.current);
    for (var element in event.lines.skip(1)) {
      log(element);
    }
  }
}
