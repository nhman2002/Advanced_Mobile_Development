// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$MessageDetailScreenArguments extends RootStackRouter {
  // ignore: unused_element
  _$MessageDetailScreenArguments({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CompanyDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyDashboard(),
      );
    },
    CompanyDashboardWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyDashboardWrapper(),
      );
    },
    CompanyProfileEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyProfileEdit(),
      );
    },
    CompanyProfileInputRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyProfileInput(),
      );
    },
    CompanyProjectDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyProjectDetail(),
      );
    },
    CompanyProjectHiredRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyProjectHired(),
      );
    },
    CompanyProjectMessageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyProjectMessage(),
      );
    },
    CompanyProjectProposalsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyProjectProposals(),
      );
    },
    CompanySignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanySignup(),
      );
    },
    CompanyWelcomeRouteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyWelcomeRoute(),
      );
    },
    CoverLetterPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CoverLetterPage(),
      );
    },
    FavoriteProjectPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FavoriteProjectPage(),
      );
    },
    ForgotPasswordPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    MessageDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MessageDetailScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MessageDetailScreen(
          key: args.key,
          userId: args.userId,
          receiverId: args.receiverId,
          projectId: args.projectId,
          receiverName: args.receiverName,
        ),
      );
    },
    MessageListScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessageListScreen(),
      );
    },
    MyAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyApp(),
      );
    },
    ProjectFilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProjectFilter(),
      );
    },
    ProjectListWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectListWrapper(),
      );
    },
    ProjectPostWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectPostWrapper(),
      );
    },
    ProjectPosting1Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectPosting1(),
      );
    },
    ProjectPosting2Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectPosting2(),
      );
    },
    ProjectPosting3Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectPosting3(),
      );
    },
    ProjectPosting4Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectPosting4(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignupPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignupPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    SplashWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashWrapper(),
      );
    },
    StudentDashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentDashBoard(),
      );
    },
    StudentDashBoardWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentDashBoardWrapper(),
      );
    },
    StudentProfileInputCVRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StudentProfileInputCV(),
      );
    },
    StudentProfileInputExperienceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentProfileInputExperience(),
      );
    },
    StudentProfileInputTechStackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentProfileInputTechStack(),
      );
    },
    StudentProfileInputWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentProfileInputWrapper(),
      );
    },
    StudentProjectDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentProjectDetail(),
      );
    },
    StudentProjectListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentProjectList(),
      );
    },
    StudentSignupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentSignup(),
      );
    },
    StudentWorkingProjectsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudentWorkingProjects(),
      );
    },
    SwitchAccountPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SwitchAccountPage(),
      );
    },
  };
}

/// generated route for
/// [CompanyDashboard]
class CompanyDashboardRoute extends PageRouteInfo<void> {
  const CompanyDashboardRoute({List<PageRouteInfo>? children})
      : super(
          CompanyDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyDashboardWrapper]
class CompanyDashboardWrapperRoute extends PageRouteInfo<void> {
  const CompanyDashboardWrapperRoute({List<PageRouteInfo>? children})
      : super(
          CompanyDashboardWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyDashboardWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProfileEdit]
class CompanyProfileEditRoute extends PageRouteInfo<void> {
  const CompanyProfileEditRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProfileEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProfileInput]
class CompanyProfileInputRoute extends PageRouteInfo<void> {
  const CompanyProfileInputRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProfileInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProfileInputRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProjectDetail]
class CompanyProjectDetailRoute extends PageRouteInfo<void> {
  const CompanyProjectDetailRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProjectDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProjectDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProjectHired]
class CompanyProjectHiredRoute extends PageRouteInfo<void> {
  const CompanyProjectHiredRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProjectHiredRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProjectHiredRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProjectMessage]
class CompanyProjectMessageRoute extends PageRouteInfo<void> {
  const CompanyProjectMessageRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProjectMessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProjectMessageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyProjectProposals]
class CompanyProjectProposalsRoute extends PageRouteInfo<void> {
  const CompanyProjectProposalsRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProjectProposalsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProjectProposalsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanySignup]
class CompanySignupRoute extends PageRouteInfo<void> {
  const CompanySignupRoute({List<PageRouteInfo>? children})
      : super(
          CompanySignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanySignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyWelcomeRoute]
class CompanyWelcomeRouteRoute extends PageRouteInfo<void> {
  const CompanyWelcomeRouteRoute({List<PageRouteInfo>? children})
      : super(
          CompanyWelcomeRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyWelcomeRouteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CoverLetterPage]
class CoverLetterPageRoute extends PageRouteInfo<void> {
  const CoverLetterPageRoute({List<PageRouteInfo>? children})
      : super(
          CoverLetterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoverLetterPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteProjectPage]
class FavoriteProjectPageRoute extends PageRouteInfo<void> {
  const FavoriteProjectPageRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteProjectPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteProjectPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordPageRoute extends PageRouteInfo<void> {
  const ForgotPasswordPageRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute({List<PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessageDetailScreen]
class MessageDetailScreenRoute
    extends PageRouteInfo<MessageDetailScreenRouteArgs> {
  MessageDetailScreenRoute({
    Key? key,
    required int userId,
    required int receiverId,
    required int projectId,
    required String receiverName,
    List<PageRouteInfo>? children,
  }) : super(
          MessageDetailScreenRoute.name,
          args: MessageDetailScreenRouteArgs(
            key: key,
            userId: userId,
            receiverId: receiverId,
            projectId: projectId,
            receiverName: receiverName,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageDetailScreenRoute';

  static const PageInfo<MessageDetailScreenRouteArgs> page =
      PageInfo<MessageDetailScreenRouteArgs>(name);
}

class MessageDetailScreenRouteArgs {
  const MessageDetailScreenRouteArgs({
    this.key,
    required this.userId,
    required this.receiverId,
    required this.projectId,
    required this.receiverName,
  });

  final Key? key;

  final int userId;

  final int receiverId;

  final int projectId;

  final String receiverName;

  @override
  String toString() {
    return 'MessageDetailScreenRouteArgs{key: $key, userId: $userId, receiverId: $receiverId, projectId: $projectId, receiverName: $receiverName}';
  }
}

/// generated route for
/// [MessageListScreen]
class MessageListScreenRoute extends PageRouteInfo<void> {
  const MessageListScreenRoute({List<PageRouteInfo>? children})
      : super(
          MessageListScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageListScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyApp]
class MyAppRoute extends PageRouteInfo<void> {
  const MyAppRoute({List<PageRouteInfo>? children})
      : super(
          MyAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectFilter]
class ProjectFilterRoute extends PageRouteInfo<void> {
  const ProjectFilterRoute({List<PageRouteInfo>? children})
      : super(
          ProjectFilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectFilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectListWrapper]
class ProjectListWrapperRoute extends PageRouteInfo<void> {
  const ProjectListWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProjectListWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectListWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectPostWrapper]
class ProjectPostWrapperRoute extends PageRouteInfo<void> {
  const ProjectPostWrapperRoute({List<PageRouteInfo>? children})
      : super(
          ProjectPostWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectPostWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectPosting1]
class ProjectPosting1Route extends PageRouteInfo<void> {
  const ProjectPosting1Route({List<PageRouteInfo>? children})
      : super(
          ProjectPosting1Route.name,
          initialChildren: children,
        );

  static const String name = 'ProjectPosting1Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectPosting2]
class ProjectPosting2Route extends PageRouteInfo<void> {
  const ProjectPosting2Route({List<PageRouteInfo>? children})
      : super(
          ProjectPosting2Route.name,
          initialChildren: children,
        );

  static const String name = 'ProjectPosting2Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectPosting3]
class ProjectPosting3Route extends PageRouteInfo<void> {
  const ProjectPosting3Route({List<PageRouteInfo>? children})
      : super(
          ProjectPosting3Route.name,
          initialChildren: children,
        );

  static const String name = 'ProjectPosting3Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectPosting4]
class ProjectPosting4Route extends PageRouteInfo<void> {
  const ProjectPosting4Route({List<PageRouteInfo>? children})
      : super(
          ProjectPosting4Route.name,
          initialChildren: children,
        );

  static const String name = 'ProjectPosting4Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsScreenRoute extends PageRouteInfo<void> {
  const SettingsScreenRoute({List<PageRouteInfo>? children})
      : super(
          SettingsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignupPage]
class SignupPageRoute extends PageRouteInfo<void> {
  const SignupPageRoute({List<PageRouteInfo>? children})
      : super(
          SignupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute({List<PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashWrapper]
class SplashWrapperRoute extends PageRouteInfo<void> {
  const SplashWrapperRoute({List<PageRouteInfo>? children})
      : super(
          SplashWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentDashBoard]
class StudentDashBoardRoute extends PageRouteInfo<void> {
  const StudentDashBoardRoute({List<PageRouteInfo>? children})
      : super(
          StudentDashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentDashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentDashBoardWrapper]
class StudentDashBoardWrapperRoute extends PageRouteInfo<void> {
  const StudentDashBoardWrapperRoute({List<PageRouteInfo>? children})
      : super(
          StudentDashBoardWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentDashBoardWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProfileInputCV]
class StudentProfileInputCVRoute extends PageRouteInfo<void> {
  const StudentProfileInputCVRoute({List<PageRouteInfo>? children})
      : super(
          StudentProfileInputCVRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProfileInputCVRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProfileInputExperience]
class StudentProfileInputExperienceRoute extends PageRouteInfo<void> {
  const StudentProfileInputExperienceRoute({List<PageRouteInfo>? children})
      : super(
          StudentProfileInputExperienceRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProfileInputExperienceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProfileInputTechStack]
class StudentProfileInputTechStackRoute extends PageRouteInfo<void> {
  const StudentProfileInputTechStackRoute({List<PageRouteInfo>? children})
      : super(
          StudentProfileInputTechStackRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProfileInputTechStackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProfileInputWrapper]
class StudentProfileInputWrapperRoute extends PageRouteInfo<void> {
  const StudentProfileInputWrapperRoute({List<PageRouteInfo>? children})
      : super(
          StudentProfileInputWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProfileInputWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProjectDetail]
class StudentProjectDetailRoute extends PageRouteInfo<void> {
  const StudentProjectDetailRoute({List<PageRouteInfo>? children})
      : super(
          StudentProjectDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProjectDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentProjectList]
class StudentProjectListRoute extends PageRouteInfo<void> {
  const StudentProjectListRoute({List<PageRouteInfo>? children})
      : super(
          StudentProjectListRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentProjectListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentSignup]
class StudentSignupRoute extends PageRouteInfo<void> {
  const StudentSignupRoute({List<PageRouteInfo>? children})
      : super(
          StudentSignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentSignupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StudentWorkingProjects]
class StudentWorkingProjectsRoute extends PageRouteInfo<void> {
  const StudentWorkingProjectsRoute({List<PageRouteInfo>? children})
      : super(
          StudentWorkingProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentWorkingProjectsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SwitchAccountPage]
class SwitchAccountPageRoute extends PageRouteInfo<void> {
  const SwitchAccountPageRoute({List<PageRouteInfo>? children})
      : super(
          SwitchAccountPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwitchAccountPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
