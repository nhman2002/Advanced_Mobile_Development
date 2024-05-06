import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_hub/core/config/appInit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
  if (value) {
    Permission.notification.request();
  }
});
  await appInit();
  runApp(const MainApp());
}
