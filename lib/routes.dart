import 'package:flutter/material.dart';
import 'package:student_hub/UI/Auth/student.dart';

import 'ui/Auth/login.dart';
import 'ui/Auth/signup.dart';
import 'ui/Auth/company.dart';
import 'UI/ProfileCreation/CompanyCreation/Welcome.dart';
import 'UI/ProfileCreation/CompanyCreation/Dashboard.dart';
import 'UI/ProfileCreation/CompanyCreation/CompanyProfileInput.dart';
import 'UI/ProfileCreation/CompanyCreation/CompanyProfileEdit.dart';
import 'UI/Project/ProjectPage/ProjectList.dart';
import 'UI/Project/ProjectPage/ProjectDetail.dart';
import 'UI/Project/ProjectPage/ProjectPage.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String signup = '/signup';
  static const String studentSignup = '/studentSignup';
  static const String companySignup = '/companySignup';
  static const String letGetStarted =
      '/letGetStarted'; // Corrected the route name
  static const String dashBoard = '/dashBoard'; // Corrected the route name
  static const String companyProfileInput =
      '/companyProfileInput'; // Corrected the route name
  static const String companyProfileEdit =
      '/companyProfileEdit'; // Corrected the route name
  static const String projectList = '/project';
  static const String projectDetail = '/projectDetail';
  static const String projectPage = '/projectPage';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginPage(),
    signup: (BuildContext context) => SignupPage(),
    studentSignup: (BuildContext context) => StudentSignup(),
    companySignup: (BuildContext context) => CompanySignup(),
    letGetStarted: (BuildContext context) =>
        LetGetStartedsScreen(), // Added the route for LetGetStartedsScreen
    dashBoard: (BuildContext context) =>
        DashBoard(), // Added the route for LetGetStartedsScreen
    companyProfileInput: (BuildContext context) =>
        CompanyProfileInput(), // Added the route for LetGetStartedsScreen
    companyProfileEdit: (BuildContext context) => CompanyProfileEdit(),
    projectList: (BuildContext context) => ProjectList(),
    projectDetail: (BuildContext context) => ProjectDetail(),
    projectPage: (BuildContext context) => ProjectPage(),
  };
}
