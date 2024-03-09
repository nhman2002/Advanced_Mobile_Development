import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:student_hub/UI/Auth/login.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/routes.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of this application.

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student hub',
          routes: Routes.routes,
          home:  HomeScreen() 
        );
      },
    );
  }
}
