import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final router = AppRouter(navigatorKey: navigatorKey);


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}


