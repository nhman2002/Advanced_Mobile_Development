import 'package:flutter/material.dart';

import 'ui/Auth/login.dart';
import 'ui/home.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginPage(),
  };
}