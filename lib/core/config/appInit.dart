import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_hub/core/config/dependency.dart';

Future<void> appInit() async {
  await initializeDependency();
  //storage permission

  //init theme from json  


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

