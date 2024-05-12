import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_hub/core/config/appInit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
  if (value) {
    Permission.notification.request();
  }
});
  await appInit();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'lib/common/translations',
      fallbackLocale: Locale('en'),
      child: const MainApp()));
}


