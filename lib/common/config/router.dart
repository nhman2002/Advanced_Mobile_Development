import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/Auth/forgotPassword/forgot_password.dart';
import 'package:student_hub/UI/Chat/VideoCall/VideoCall.dart';
import 'package:student_hub/UI/Student/DashBoard/OfferList.dart';
import 'package:student_hub/UI/Student/DashBoard/StudentDashBoardArchieved.dart';
import 'package:student_hub/UI/Student/Information/StudentInformation.dart';
import 'package:student_hub/UI/Student/Offer/offerDetail.dart';
import 'package:student_hub/UI/auth/student/student.dart';
import 'package:student_hub/UI/chat/ChatList/MessageList.dart';
import 'package:student_hub/UI/chat/ChatScreen/MessageDetail.dart';
import 'package:student_hub/UI/company/CompanyDashBoardWorking.dart';
import 'package:student_hub/UI/company/CompanyDashboardArchieved.dart';
import 'package:student_hub/UI/company/CompanyDashboardWrapper.dart';
import 'package:student_hub/UI/company/CompanyProjectDetail.dart';
import 'package:student_hub/UI/company/CompanyProjectHired.dart';
import 'package:student_hub/UI/company/CompanyProjectMessage.dart';
import 'package:student_hub/UI/company/CompanyProjectProposals.dart';
import 'package:student_hub/UI/Student/DashBoard/StudentDashBoard.dart';
import 'package:student_hub/UI/Student/DashBoard/StudentDashBoardWorking.dart';
import 'package:student_hub/UI/Student/DashBoard/StudentDashBoardWrapper.dart';
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
import 'package:student_hub/UI/notification/notificationScreen.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/StudentProfileInput2.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInputWrapper.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/AccountSwitchPage.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/UI/auth/login/login.dart';
import 'package:student_hub/UI/auth/signup/signup.dart';
import 'package:student_hub/UI/auth/company/company.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyWelcome.dart';
import 'package:student_hub/UI/company/CompanyDashboard.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileInput/CompanyProfileInput.dart';
import 'package:student_hub/UI/profileCreation/CompanyCreation/CompanyProfileEdit.dart';
import 'package:student_hub/UI/profileCreation/changePassword/change_password.dart';
import 'package:student_hub/UI/profileCreation/settingScreen/SettingScreen.dart';
import 'package:student_hub/UI/splash_screen/splash_wrapper.dart';
import 'package:student_hub/UI/splash_screen/splash_screen.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInput1.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/studentProfileInput3.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route,Screen',
)
class MessageDetailScreenArguments {
  final int userId;
  final int receiverId;

  MessageDetailScreenArguments(
      {required this.userId, required this.receiverId});
}

class AppRouter extends _$MessageDetailScreenArguments {
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
                  page: SplashScreenRoute.page,
                  initial: true,
                  path: '',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: HomeScreenRoute.page,
                  path: 'home',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: LoginPageRoute.page,
                  path: 'login',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: ForgotPasswordPageRoute.page,
                  path: 'forgotPassword',
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
                  page: CompanyDashboardWrapperRoute.page,
                  path: 'CompanyDashBoardWrapper',
                  children: [
                    CustomRoute(
                      page: CompanyDashboardRoute.page,
                      initial: true,
                      path: 'companyDashBoard',
                    ),
                    CustomRoute(
                      page: CompanyProjectProposalsRoute.page,
                      path: 'companyProjectProposal',
                    ),
                    CustomRoute(
                      page: CompanyDashboardWorkingRoute.page,
                      path: 'companyDashBoardWorking',
                    ),
                    CustomRoute(
                      page: CompanyDashboardArchievedRoute.page,
                      path: 'companyDashBoardArchieved',
                    ),
                    CustomRoute(
                      page: CompanyProjectDetailRoute.page,
                      path: 'companyProjectDetail',
                    ),
                    CustomRoute(
                      page: CompanyProjectHiredRoute.page,
                      path: 'companyProjectHired',
                    ),
                    CustomRoute(
                      page: CompanyProjectMessageRoute.page,
                      path: 'companyProjectMessage',
                    ),
                  ]),

              // transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: VideoCallScreenRoute.page,
                  path: 'videoCall',
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
              AutoRoute(
                page: SettingsScreenRoute.page,
                path: 'settingScreen',
              ),
              CustomRoute(
                  page: NotificationScreenRoute.page,
                  path: 'forgotPassword',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: ChangePasswordScreenRoute.page,
                  path: 'changePassword',
                  transitionsBuilder: TransitionsBuilders.fadeIn),

              CustomRoute(
                  page: MessageListScreenRoute.page,
                  path: 'messageList',
                  transitionsBuilder: TransitionsBuilders.fadeIn),

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
                  ]),

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
              CustomRoute(
                  page: ProjectListWrapperRoute.page,
                  path: 'projectListWrapper',
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  children: [
                    AutoRoute(
                        page: StudentProjectListRoute.page,
                        initial: true,
                        path: 'projectList'),
                    AutoRoute(
                        page: StudentProjectDetailRoute.page,
                        path: 'projectDetail'),
                    AutoRoute(
                        page: FavoriteProjectPageRoute.page,
                        path: 'projectPage'),
                    AutoRoute(
                        page: CoverLetterPageRoute.page, path: 'projectCover'),
                  ]),
              CustomRoute(
                  page: StudentDashBoardWrapperRoute.page,
                  path: 'studentDashBoardWrapper',
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  children: [
                    CustomRoute(
                        page: StudentDashBoardRoute.page,
                        initial: true,
                        path: 'studentDashBoard',
                        transitionsBuilder: TransitionsBuilders.fadeIn),
                    CustomRoute(
                        page: StudentWorkingProjectsRoute.page,
                        path: 'studentDashBoardWorking',
                        transitionsBuilder: TransitionsBuilders.fadeIn),
                    CustomRoute(
                        page: StudentArchievedProjectRoute.page,
                        path: 'studentDashBoardArchieved',
                        transitionsBuilder: TransitionsBuilders.fadeIn),
                  ]),
              CustomRoute(
                  page: MessageDetailScreenRoute.page,
                  path: 'messageScreen',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              CustomRoute(
                  page: MessageListScreenRoute.page,
                  path: 'messageList',
                  transitionsBuilder: TransitionsBuilders.fadeIn),
              // CustomRoute(
              //     page: StudentProfileCreationRoute.page, path: 'studentProfileCreation'),
              // CustomRoute(
              //     page: CompanyProfileInputRoute.page, path: 'companyProfileInput'),
              // CustomRoute(
              //     page: CompanyProfileEditRoute.page, path: 'companyProfileEdit'),
            ]),
      ];
}
