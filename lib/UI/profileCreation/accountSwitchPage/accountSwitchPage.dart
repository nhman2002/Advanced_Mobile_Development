import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_cubit.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/storage/local_storage.dart';

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

class _SwitchAccountPage extends State<SwitchAccountWidget> {

  final _localStorage = getIt.get<LocalStorage>();



  @override
  Widget build(BuildContext context) {
    final username = _localStorage.getString(key: StorageKey.userName)!;
    final userRoles = _localStorage.getString(key: StorageKey.userRoles)!;
    final isStudent = context.read<AccountSwitchCubit>().state.isStudent;
    final isCompany = context.read<AccountSwitchCubit>().state.isCompany;
    final hasMultipleRoles = context.read<AccountSwitchCubit>().state.hasMultipleRoles;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              // Routing logic here
            },
            icon: Icon(
              Icons.search,
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
                  'Company',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ): Text(
                  'Student',
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
                        title: isCompany == true ? Text(username+' Student'): Text(username+' Company'),
                        // subtitle: Text(
                        //   'Student',
                        //   style: TextStyle(
                        //     fontSize: 14.0,
                        //     color: Colors.grey,
                        //   ),
                        // ),
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
                    // context.router.push(const InputProfileTechStackScreenRoute());
                    context.router.push(const  CompanyProfileInputRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text('Profiles'),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //context.router.push(const InputProfileTechStackScreenRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.settings, color: Colors.black),
                    title: Text('Settings'),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for Log out button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.black),
                    title: Text('Log out'),
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
          title: Text(roles.first == 0 ? 'Student' : 'Company'),
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
            roles.contains(0) && roles.contains(1) ? 'Student, Company' : 
            roles.contains(0) ? 'Student' : 
            'Company',
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
                  title: Text('Hai Pham Student'),
                  subtitle: Text(
                    'Student',
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
  void handleLogout(BuildContext context) {
    // Add your logout logic here
  }
}
