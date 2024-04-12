import 'package:flutter/services.dart';
import 'package:student_hub/core/config/dependency.dart';

Future<void> appInit() async {
  await initializeDependency();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

