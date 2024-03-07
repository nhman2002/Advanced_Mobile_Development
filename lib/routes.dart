import 'package:flutter/material.dart';
import 'package:student_hub/UI/Auth/student.dart';

import 'ui/Auth/login.dart';
import 'ui/Auth/signup.dart';
import 'ui/Auth/company.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String studentSignup = '/studentSignup';
  static const String companySignup = '/companySignup';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginPage(),
    signup: (BuildContext context) => SignupPage(),
    studentSignup: (BuildContext context) => StudentSignup(),
    companySignup: (BuildContext context) => CompanySignup(),
  };
}