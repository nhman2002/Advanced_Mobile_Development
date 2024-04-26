import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/Auth/student/student.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectDetail.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectList.dart';
import 'package:student_hub/UI/Project/ProjectFilter.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectListCover.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectListWrapper.dart';
import 'package:student_hub/UI/Student/ProjectList/SavedProjectPage.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost1.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost2.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost3.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPost4.dart';
import 'package:student_hub/UI/Project/ProjectPost/ProjectPostWrapper.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/StudentProfileInput2.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInputWrapper.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/accountSwitchPage.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/UI/Auth/login/login.dart';
import 'package:student_hub/UI/Auth/signup/signup.dart';
import 'package:student_hub/UI/Auth/company/company.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyWelcome.dart';
import 'package:student_hub/UI/Dashboard/company/CompanyDashboard.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileInput/CompanyProfileInput.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileEdit.dart';
import 'package:student_hub/UI/splash_screen/splash_wrapper.dart';
import 'package:student_hub/UI/splash_screen/splash_screen.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInput1.dart';
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
  List<CustomRoute> get routes => [
        CustomRoute(
            page: SplashWrapperRoute.page,
            initial: true,
            path: '/',
            transitionsBuilder: null,
            children: [
              CustomRoute(
                  page: SplashScreenRoute.page, initial: true, path: ''),
              CustomRoute(page: MyAppRoute.page, path: 'home',
              transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: LoginPageRoute.page,
                  path: 'login',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: SignupPageRoute.page,
                  path: 'signup',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: StudentSignupRoute.page,
                  path: 'studentSignup',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: CompanySignupRoute.page,
                  path: 'companySignup',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: CompanyDashboardRoute.page,
                  path: 'dashBoard',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: CompanyWelcomeRouteRoute.page,
                  path: 'companyWelcome',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: CompanyProfileInputRoute.page,
                  path: 'companyProfileInput',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: CompanyProfileEditRoute.page,
                  path: 'companyProfileEdit',
                  transitionsBuilder: TransitionsBuilders.fadeIn),

              CustomRoute(
                  page: SwitchAccountPageRoute.page,
                  path: 'switchAccount',
                  transitionsBuilder: TransitionsBuilders.fadeIn,
              ),
              CustomRoute(
                  page: StudentProfileInputWrapperRoute.page,
                  path: 'studentProfileInput',
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  children: [
                    CustomRoute(
                        page: StudentProfileInputTechStackRoute.page,
                        initial: true,
                        path: 'studentProfileInput1'),
                    CustomRoute(
                        page: StudentProfileInputExperienceRoute.page,
                        path: 'studentProfileInput2',
                        transitionsBuilder: TransitionsBuilders.fadeIn),
                    CustomRoute(
                        page: StudentProfileInputCVRoute.page,
                        path: 'studentProfileInput3',
                        transitionsBuilder: TransitionsBuilders.fadeIn),
                  ]
              ),

              CustomRoute(
                  page: ProjectFilterRoute.page,
                  path: 'projectFilter',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: ProjectPostWrapperRoute.page,
                  path: 'projectPost',
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  children: [
                    CustomRoute(
                        page: ProjectPosting1Route.page,
                        initial: true,
                        path: 'projectPost1'),
                    CustomRoute(
                      page: ProjectPosting2Route.page,
                      path: 'projectPost2',
                      transitionsBuilder: TransitionsBuilders.fadeIn,
                    ),
                    CustomRoute(
                      page: ProjectPosting3Route.page,
                      path: 'projectPost3',
                      transitionsBuilder: TransitionsBuilders.fadeIn,
                    ),
                    CustomRoute(
                      page: ProjectPosting4Route.page,
                      path: 'projectPost4',
                      transitionsBuilder: TransitionsBuilders.fadeIn,
                    ),
                  ]),
            AutoRoute(
                page: ProjectListWrapperRoute.page,
                path: 'projectListWrapper',
                children: [
                    AutoRoute(
                        page: StudentProjectListRoute.page,
                        initial: true,
                        path: 'projectList'),
                    AutoRoute(
                        page: StudentProjectDetailRoute.page, path: 'projectDetail'),
                    AutoRoute(
                        page: FavoriteProjectPageRoute.page, path: 'projectPage'),
                    AutoRoute(
                        page: CoverLetterPageRoute.page, path: 'projectCover'),
                  ]),                                         
             // CustomRoute(
              //     page: StudentProfileCreationRoute.page, path: 'studentProfileCreation'),
              // CustomRoute(
              //     page: CompanyProfileInputRoute.page, path: 'companyProfileInput'),
              // CustomRoute(
              //     page: CompanyProfileEditRoute.page, path: 'companyProfileEdit'),
            ]),
      ];
}
