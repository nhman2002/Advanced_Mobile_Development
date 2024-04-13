
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/Auth/student/student.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/UI/Auth/login/login.dart';
import 'package:student_hub/UI/Auth/signup/signup.dart';
import 'package:student_hub/UI/Auth/company/company.dart';
import 'package:student_hub/UI/ProfileCreation/CompanyCreation/Welcome.dart';
import 'package:student_hub/UI/ProfileCreation/CompanyCreation/Dashboard.dart';
import 'package:student_hub/UI/ProfileCreation/CompanyCreation/CompanyProfileInput.dart';
import 'package:student_hub/UI/ProfileCreation/CompanyCreation/CompanyProfileEdit.dart';
import 'package:student_hub/UI/splash_screen/splash_wrapper.dart';
import 'package:student_hub/UI/splash_screen/splash_screen.dart';


part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)

class AppRouter extends _$AppRouter {
  AppRouter({required GlobalKey<NavigatorState> navigatorKey})
      : super(navigatorKey: navigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
      AutoRoute(
          page: SplashWrapperRoute.page,
          initial: true,
          path: '/',
          children: [
            AutoRoute(
                page: SplashScreenRoute.page,
                initial: true,
                path: ''),
            // AutoRoute(page: MyAppRoute.page, path: 'home'),
            AutoRoute(page: LoginPageRoute.page, path: 'login'),
            AutoRoute(
                page: SignupPageRoute.page, path: 'signup'),
            AutoRoute(
                page: StudentSignupRoute.page, path: 'studentSignup'),
            AutoRoute(
                page: CompanySignupRoute.page, path: 'companySignup'),
            AutoRoute(
                page: DashBoardRoute.page, path: 'dashBoard'),
            // AutoRoute(
            //     page: CompanyProfileInputRoute.page, path: 'companyProfileInput'),
            // AutoRoute(
            //     page: CompanyProfileEditRoute.page, path: 'companyProfileEdit'),
          ]),
    ];
}
