import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_cubit.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class SwitchAccountPage
    extends BaseWidget<AccountSwitchCubit, AccountSwitchState> {
  const SwitchAccountPage({Key? key}) : super(key: key);
  @override
  Widget buildWidget(BuildContext context) {
    return const SwitchAccountWidget();
  }

  @override
  AccountSwitchCubit? provideCubit(BuildContext context) {
    return AccountSwitchCubit();
  }
}

class SwitchAccountWidget extends StatefulWidget {
  const SwitchAccountWidget({Key? key}) : super(key: key);

  @override
  State<SwitchAccountWidget> createState() => _SwitchAccountPage();
}

class _SwitchAccountPage extends State<SwitchAccountWidget>
    with SnackBarDefault {
  final _localStorage = getIt.get<LocalStorage>();
  final _networkManager = getIt.get<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    final _localStorage = getIt.get<LocalStorage>();

    return BlocBuilder<AccountSwitchCubit, AccountSwitchState>(
      builder: (context, state) {
        final userRoles = state.userRoles;
        final hasCompanyProfile = state.hasCompanyProfile;
        final hasStudentProfile = state.hasStudentProfile;
        final currentRole = state.currentRole;
        return Scaffold(
          appBar: AppBar(
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  if (currentRole == 0 && hasStudentProfile == true) {
                    context.router.replace(const ProjectListWrapperRoute());
                  } else if (currentRole == 1 && hasCompanyProfile == true) {
                    context.router
                        .replace(const CompanyDashboardWrapperRoute());
                  } else
                    showSnackBarWarning(
                        context, "accountswitch1".tr());
                },
                icon: Icon(
                  Icons.home,
                  size: 40.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (userRoles != null)
                  _buildUserRolesUI(userRoles, context, currentRole ?? -1),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleProfile(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("accountSwitchPage_ProfileCreation3".tr()),
                      ),
                    ),
                    Divider(

                      thickness: 1.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gotoSetting(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("accountSwitchPage_ProfileCreation4".tr()),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for Log out button
                        handleLogout(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("accountSwitchPage_ProfileCreation5".tr()),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void handleProfile(BuildContext context) {
    final hasCompanyProfile =
        context.read<AccountSwitchCubit>().state.hasCompanyProfile;
    final hasStudentProfile =
        context.read<AccountSwitchCubit>().state.hasStudentProfile;
    final currentRole = context.read<AccountSwitchCubit>().state.currentRole;
    if (currentRole == 1) if (hasCompanyProfile == true)
      context.router.replace(const CompanyProfileEditRoute());
    else
      context.router.replace(const CompanyProfileInputRoute());
    else if (currentRole == 0) if (hasStudentProfile == true)
      context.router.replace(const StudentProfileInputWrapperRoute());
    else
      context.router.replace(const StudentProfileInputWrapperRoute());
  }

  Widget _buildUserRolesUI(
      List<int> roles, BuildContext context, int currentRole) {
    if (roles.length == 1) {
      String username;
      if (currentRole == 0) {
        username = context.read<AccountSwitchCubit>().state.userName ?? '';
      } else if (context.read<AccountSwitchCubit>().state.hasCompanyProfile ==
          false) {
        username = context.read<AccountSwitchCubit>().state.userName ?? '';
      } else {
        username = context.read<AccountSwitchCubit>().state.companyName ?? '';
      }
      // If there's only one role, display an ExpansionTile with an icon to add a new role
      return ExpansionTile(
        tilePadding: const EdgeInsets.only(right: 16.0),
        title: ListTile(
          leading: Icon(
            roles.first == 0 ? Icons.account_circle : Icons.business,
            size: 40.0,
          ),
          title: Text(username),
          subtitle: Text(
            roles.contains(0)
                ? "accountSwitchPage_ProfileCreation2".tr()
                : "accountSwitchPage_ProfileCreation1".tr(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Divider(
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                    size: 40.0,
                  ),
                  title: Text(
                      "Add a ${currentRole == 0 ? 'company' : 'student'} profile"),
                  onTap: () {
                    if (currentRole == 0)
                      context.router.push(const CompanyProfileInputRoute());
                    else
                      context.router
                          .push(const StudentProfileInputWrapperRoute());
                  },
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      // If there are two roles, display the name of the other role
      int otherRole = 1 - currentRole;
      String mainRole;
      String secondaryRole;
      if (currentRole == 1) {
        if (context.read<AccountSwitchCubit>().state.hasCompanyProfile ==
            false) {
          mainRole = context.read<AccountSwitchCubit>().state.userName ?? '';
          secondaryRole =
              context.read<AccountSwitchCubit>().state.userName ?? '';
        } else {
          mainRole = context.read<AccountSwitchCubit>().state.companyName ?? '';
          secondaryRole =
              context.read<AccountSwitchCubit>().state.userName ?? '';
        }
      } else {
        mainRole = context.read<AccountSwitchCubit>().state.userName ?? '';
        secondaryRole =
            context.read<AccountSwitchCubit>().state.companyName ?? '';
      }
      return ExpansionTile(
        tilePadding: const EdgeInsets.only(right: 16.0),
        title: ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 40.0,
          ),
          title: Text(mainRole),
          subtitle: Text(
            currentRole == 0
                ? "accountSwitchPage_ProfileCreation2".tr()
                : "accountSwitchPage_ProfileCreation1".tr(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Divider(
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40.0,
                  ),
                  title: Text(secondaryRole),
                  subtitle: Text(
                    otherRole == 0
                        ? "accountSwitchPage_ProfileCreation2".tr()
                        : "accountSwitchPage_ProfileCreation1".tr(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  onTap: () {
                    context.read<AccountSwitchCubit>().switchRole(otherRole);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  void handleLogout(BuildContext context) async {
    await context.read<AccountSwitchCubit>().logout();
    context.router.replace(const HomeScreenRoute());

    // _networkManager.closeSocket();
  }

  void gotoSetting(BuildContext context) {
    context.router.push(const SettingsScreenRoute());
  }
}
