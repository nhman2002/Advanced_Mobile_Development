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
class SwitchAccountPage extends BaseWidget<AccountSwitchCubit, AccountSwitchState> {
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

class _SwitchAccountPage extends State<SwitchAccountWidget> with SnackBarDefault {

  final _localStorage = getIt.get<LocalStorage>();
  final _networkManager = getIt.get<NetworkManager>();


@override
  Widget build(BuildContext context) {
    final _localStorage = getIt.get<LocalStorage>();

    return BlocBuilder<AccountSwitchCubit, AccountSwitchState>(
      builder: (context, state) {
        final username = _localStorage.getString(key: StorageKey.userName) ?? '';
        final userRoles = _localStorage.getString(key: StorageKey.userRoles) ?? '';
        final hasCompanyProfile = state.hasCompanyProfile;
        final hasStudentProfile = state.hasStudentProfile;
        final isStudent = state.isStudent;
        final isCompany = state.isCompany;
        final hasMultipleRoles = state.hasMultipleRoles;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  if (isStudent == true && hasStudentProfile == true) {
                    context.router.replace(const ProjectListWrapperRoute());
                  } else if (isCompany == true && hasCompanyProfile == true) {
                    context.router.replace(const CompanyDashboardWrapperRoute());
                  }
                  else
                    showSnackBarWarning(context, 'Please complete your profile first!');     
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
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
                if (hasMultipleRoles == false)(
                  _buildUserRolesUI(userRoles.split(',').map((e) => int.parse(e)).toList())
                )
                else
                ExpansionTile(
                  tilePadding: const EdgeInsets.only(right: 16.0),
                  title: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    title: Text(username),
                    subtitle: isCompany == true ? Text(
                      "accountSwitchPage_ProfileCreation1".tr(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ): Text(
                      "accountSwitchPage_ProfileCreation2".tr(),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    )
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 40.0,
                            ),
                            title: isCompany == true ? Text(username+' '+"accountSwitchPage_ProfileCreation2".tr()): Text(username+' '+"accountSwitchPage_ProfileCreation1".tr()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleProfile(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.black),
                        title: Text("accountSwitchPage_ProfileCreation3".tr()),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gotoSetting(context);            
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.settings, color: Colors.black),
                        title: Text("accountSwitchPage_ProfileCreation4".tr()),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for Log out button
                        handleLogout(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.black),
                        title: Text("accountSwitchPage_ProfileCreation5".tr()),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
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
      final hasCompanyProfile = context.read<AccountSwitchCubit>().state.hasCompanyProfile;
      final hasStudentProfile = context.read<AccountSwitchCubit>().state.hasStudentProfile;
      final isStudent = context.read<AccountSwitchCubit>().state.isStudent;
      final isCompany = context.read<AccountSwitchCubit>().state.isCompany;
      if (isCompany == true)
        if (hasCompanyProfile == true)
          context.router.push(const CompanyProfileEditRoute());
        else
          context.router.push(const CompanyProfileInputRoute());
      else if (isStudent == true)
        if (hasStudentProfile == true)
          context.router.push(const StudentProfileInputWrapperRoute());
        else
          context.router.push(const StudentProfileInputWrapperRoute());
  }

  Widget _buildUserRolesUI(List<int> roles) {
    // Check if user has only one role
    if (roles.length == 1) {
      // Display a button for the single role
      return ElevatedButton(
        onPressed: () {
          // Add functionality for handling the single role
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: ListTile(
          leading: Icon(
            roles.first == 0 ? Icons.account_circle : Icons.business,
            color: Colors.black,
            size: 40.0,
          ),
          title: Text(roles.first == 0 ? "accountSwitchPage_ProfileCreation2".tr() : "accountSwitchPage_ProfileCreation1".tr()),
        ),
      );
    } else {
      // Display expansion tile with multiple roles
      return ExpansionTile(
        tilePadding: const EdgeInsets.only(right: 16.0),
        title: ListTile(
          leading: Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 40.0,
          ),
          title: Text('Hai Pham'),
          subtitle: Text(
            roles.contains(0) && roles.contains(1) ? "accountSwitchPage_ProfileCreation6".tr() : 
            roles.contains(0) ? "accountSwitchPage_ProfileCreation2".tr() : 
            "accountSwitchPage_ProfileCreation1".tr(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  title: Text("accountSwitchPage_ProfileCreation7".tr()),
                  subtitle: Text(
                    "accountSwitchPage_ProfileCreation2".tr(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
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
    context.router.replace(const MyAppRoute());
    
    // _networkManager.closeSocket();
  }

  void gotoSetting(BuildContext context) {
    context.router.push(const SettingsScreenRoute());
  }


}
