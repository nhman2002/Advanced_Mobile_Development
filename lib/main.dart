import 'dart:async';

import 'package:student_hub/UI/Shub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_hub/core/config/appInit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(const MainApp());
}
