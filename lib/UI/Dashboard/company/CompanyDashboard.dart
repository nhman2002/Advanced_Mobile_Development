import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Dashboard/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/Dashboard/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';



@RoutePage()
class CompanyDashboard extends BaseWidget<CompanyDashboardCubit, CompanyDashboardState> {
  const CompanyDashboard({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const CompanyDashboardWidget();
  }

  @override
  CompanyDashboardCubit? provideCubit(BuildContext context) {
    return CompanyDashboardCubit();
  }
}

class CompanyDashboardWidget extends StatefulWidget{
  const CompanyDashboardWidget({super.key});

  @override
  State<CompanyDashboardWidget> createState() => _CompanyDashboard();

}


final _localStorage = getIt.get<LocalStorage>();

class _CompanyDashboard extends State<CompanyDashboardWidget> with SnackBarDefault {

@override
Widget build(BuildContext context) {
  return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
    builder: (context, state) {
      final projectList = state.projectList;
      
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Student Hub'),
          actions: [
            IconButton(
              onPressed: () {
                handleLogout(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    projectList.isNotEmpty ? 'Your projects' : 'Let\'s get started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (projectList.isNotEmpty)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildProjectSectionButton('All', Colors.white),
                          _buildProjectSectionButton('Working', Colors.white),
                          _buildProjectSectionButton('Archived', Colors.white),
                        ],
                      ),
                    ),
                  if (projectList.isEmpty)
                    ElevatedButton(
                      onPressed: () {
                        // Add onPressed logic here
                        print('Post a job');
                        context.router.push(const ProjectPostWrapperRoute());
                      },
                      child: Text('Post a job'),
                    ),
                ],
              ),
              SizedBox(height: 20),
              if (projectList.isEmpty)
                Column(
                  children: [
                    Text(
                      'Welcome ' + _localStorage.getString(key: StorageKey.userName)!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Let's get start with your first project post",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              if (projectList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: projectList.length,
                    itemBuilder: (context, index) {
                      final project = projectList[index];
                      return ListTile(
                        title: Text(project.title ?? ''),
                        subtitle: Text(project.description ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.assignment),
                              onPressed: () {
                                // Handle proposals
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.message),
                              onPressed: () {
                                // Handle messages
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.work),
                              onPressed: () {
                                // Handle hiring status
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              Spacer(),
              OverflowBar(children: [
                _buildCompanyDashboardItem(
                  Icons.dashboard,
                  'Dashboard',
                  Colors.black,
                ),
                _buildCompanyDashboardItem(
                  Icons.message,
                  'Message',
                  Colors.white,
                ),
                _buildCompanyDashboardItem(
                  Icons.notifications,
                  'Alerts',
                  Colors.white,
                ),
              ]),
            ],
          ),
        ),
      );
    },
  );
}


  Widget _buildProjectSectionButton(String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        label,
        style: TextStyle(color: color),
      ),
    );
  }

  Widget _buildCompanyDashboardItem(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void handleLogout(BuildContext context) {
    _localStorage.clear();
    context.router.replace(const MyAppRoute());
  }
}