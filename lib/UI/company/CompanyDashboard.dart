import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/models/output/project_model.dart';

@RoutePage()
class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({super.key});

  @override
  State<CompanyDashboard> createState() => _CompanyDashboard();
}

final _localStorage = getIt.get<LocalStorage>();

class _CompanyDashboard extends State<CompanyDashboard> with SnackBarDefault {
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
                  context.router.push(const SwitchAccountPageRoute());
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      projectList.isNotEmpty
                          ? 'Your projects'
                          : 'Let\'s get started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                if (projectList.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Add onPressed logic here
                            print('All Projects pressed');
                          },
                          child: Container(
                            padding: EdgeInsets.all(0.0),
                            color: Colors.blue,
                            child: Text(
                              'All Projects',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 2,
                          color: Colors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add onPressed logic here
                            print('Active pressed');
                          },
                          child: Text('Active '),
                        ),
                        Container(
                          height: 20,
                          width: 2,
                          color: Colors.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add onPressed logic here
                            print('Archived pressed');
                          },
                          child: Text('Archived '),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                if (projectList.isEmpty)
                  Column(
                    children: [
                      Text(
                        'Welcome ' +
                            _localStorage.getString(key: StorageKey.userName)!,
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
                    child: Container(
                      height: 400, // Adjust the height as needed
                      child: ListView.builder(
                        itemCount: projectList.length,
                        itemBuilder: (context, index) {
                          final project = projectList[index];
                          return _buildProjectListItem(project, () {
                            // Add onPressed logic here
                            print('Project ${project.title} pressed');
                            handleProjectPressed(project, context);
                          });
                        },
                      ),
                    ),
                  ),
                Spacer(),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCompanyDashboardItem(Icons.work, 'Projects',
                        Colors.white, Colors.blue.shade300),
                    _buildCompanyDashboardItem(Icons.dashboard, 'Dashboard',
                        Colors.black, Colors.grey.shade300),
                    _buildCompanyDashboardItem(Icons.message, 'Message',
                        Colors.white, Colors.blue.shade300),
                    _buildCompanyDashboardItem(Icons.notifications, 'Alerts',
                        Colors.white, Colors.blue.shade300),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectSection(String title, bool isActive) {
    return Expanded(
      child: InkWell(
        onTap: () {
          print('${title} pressed');
          // Logic corresponding to each section can be placed here
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : null, // Highlight active section
            borderRadius: isActive ? BorderRadius.circular(5) : null,
          ),
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            title,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
  // Widget _buildProjectSectionButton(String label, Color color) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     padding: EdgeInsets.all(10),
  //     child: Text(
  //       label,
  //       style: TextStyle(color: color),
  //     ),
  //   );
  // }
// ProjectListItem widget

  Widget _buildProjectListItem(ProjectOutput project, VoidCallback onPressed) {
    return GestureDetector(
      onTap: () {
        handleProjectPressed(project, context);
        context.router.push(const CompanyProjectProposalsRoute());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top section
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  project.title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    projectClicked(project.projectId!);
                    _showBottomSheet(context, project);
                  },
                ),
              ],
            ),
            subtitle: Text(project.createdAt ?? ''),
          ),
          // Middle section
          ListTile(
            title: Text(project.description ?? ''),
          ),
          // Bottom section
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Proposals: ${project.countProposal}'),
                Text('Messages: ${project.countMessages}'),
                Text('Hired: ${project.countHired}'),
              ],
            ),
          ),
          Divider(), // Optional divider between items
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, ProjectOutput project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensure the bottom sheet is fully visible
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.list),
                title: Text(
                  'View Proposals',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  context.router.push(const CompanyProjectProposalsRoute());
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  'View Messages',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  context.router.push(const CompanyProjectMessageRoute());
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text(
                  'View Hired',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  context.router.push(const CompanyProjectHiredRoute());
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.remove_red_eye),
                title: Text(
                  'View job posting',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  context.router.push(const CompanyProjectDetailRoute());
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text(
                  'Edit Posting',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  // Add logic to edit posting
                  print('Edit Posting');
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text(
                  'Delete Posting',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  // Add logic to delete posting
                  print('Delete Posting');
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.play_arrow),
                title: Text(
                  'Start Working This Project',
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  startWorkingOnProject(project);
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompanyDashboardItem(
      IconData icon, String label, Color color, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: AnimatedButton(
        icon: icon,
        label: label,
        color: color,
        bgColor: bgColor,
        onPressed: () {
          // Add onPressed logic here
          if (label == 'Projects') {
            context.router.push(const StudentSignupRoute());
          } else if (label == 'Dashboard') {
            context.router.push(const StudentSignupRoute());
          } else if (label == 'Message') {
            context.router.push(const MessageListScreenRoute());
          } else if (label == 'Alerts') {
            context.router.push(const StudentSignupRoute());
          }
        },
      ),
    );
  }

  void handleLogout(BuildContext context) {
    _localStorage.clear();
    context.router.replace(const MyAppRoute());
  }

  Future<void> handleProjectPressed(
      ProjectOutput project, BuildContext context) async {
    await context
        .read<CompanyDashboardCubit>()
        .projectClicked(project.projectId!);
  }

  void projectClicked(int id) {
    context.read<CompanyDashboardCubit>().setClickedProject(id);
  }

  Future<void> startWorkingOnProject(ProjectOutput project) async {
    await context.read<CompanyDashboardCubit>().workingOnProject(project);
    showSnackBar(context, 'Project started, check active tab for details!');
  }
}
