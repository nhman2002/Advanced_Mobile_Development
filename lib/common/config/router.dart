
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/Auth/student/student.dart';
import 'package:student_hub/UI/Project/ProjectFilter.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost1.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost2.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost3.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost4.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/accountSwitchPage.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/UI/Auth/login/login.dart';
import 'package:student_hub/UI/Auth/signup/signup.dart';
import 'package:student_hub/UI/Auth/company/company.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyWelcome.dart';
import 'package:student_hub/UI/Dashboard/CompanyDashboard.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileInput/CompanyProfileInput.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileEdit.dart';
import 'package:student_hub/UI/splash_screen/splash_wrapper.dart';
import 'package:student_hub/UI/splash_screen/splash_screen.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/InputTechstack/studentProfileInput1.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInput2.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInput3.dart';


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
            AutoRoute(page: MyAppRoute.page, path: 'home'),
            AutoRoute(page: LoginPageRoute.page, path: 'login'),
            AutoRoute(
                page: SignupPageRoute.page, path: 'signup'),
            AutoRoute(
                page: StudentSignupRoute.page, path: 'studentSignup'),
            AutoRoute(
                page: CompanySignupRoute.page, path: 'companySignup'),
            AutoRoute(
                page: CompanyDashboardRoute.page, path: 'dashBoard'),
            AutoRoute(
                page: CompanyWelcomeRouteRoute.page, path: 'companyWelcome'),
            AutoRoute(
                page: CompanyProfileInputRoute.page, path: 'companyProfileInput'),
            AutoRoute(
                page: CompanyProfileEditRoute.page, path: 'companyProfileEdit'),
            AutoRoute(
                page: InputProfileTechStackScreenRoute.page, path: 'studentProfileInput1'),
            AutoRoute(
                page: SwitchAccountPageRoute.page, path: 'switchAccount',
                children: [

                  AutoRoute(
                      page: StudentInputProfileExperienceRoute.page, path: 'studentProfileInput2'),
                  AutoRoute(
                      page: StudentProfileInputCVRoute.page, path: 'studentProfileInput3'),
                ]),
            AutoRoute(
                page: ProjectFilterRoute.page, path: 'projectFilter'),
            AutoRoute(
                page: ProjectPosting1Route.page, path: 'projectPost1'),
            AutoRoute(
                page: ProjectPosting2Route.page, path: 'projectPost2'),
            AutoRoute(
                page: ProjectPosting3Route.page, path: 'projectPost3'),
            AutoRoute(
                page: ProjectPosting4Route.page, path: 'projectPost4'),

            // AutoRoute(
            //     page: StudentProfileCreationRoute.page, path: 'studentProfileCreation'),
            // AutoRoute(
            //     page: CompanyProfileInputRoute.page, path: 'companyProfileInput'),
            // AutoRoute(
            //     page: CompanyProfileEditRoute.page, path: 'companyProfileEdit'),
          ]),
    ];
}
