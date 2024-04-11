import 'dart:developer';

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      log(line);
    }
  }
}
