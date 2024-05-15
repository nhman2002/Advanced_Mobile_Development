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
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:easy_localization/easy_localization.dart';

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
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.replace(const SwitchAccountPageRoute());
                },
                icon: Icon(
                  Icons.account_circle,
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
                          ? "companydashboard_company1".tr()
                          : "companydashboard_company2".tr(),
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
                      child: Text("companydashboard_company3".tr()),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (projectList.isNotEmpty)
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildProjectSectionButton(
                            "companydashboard_company4".tr(),
                            Colors.black,
                            true, () {
                          // Add onPressed logic here
                          print('All Projects pressed');
                        }, Theme.of(context)),
                        _buildProjectSectionButton(
                            "companydashboard_company5".tr(),
                            Colors.black,
                            false, () {
                          context.router
                              .replace(const CompanyDashboardWorkingRoute());
                          print('Active pressed');
                        }, Theme.of(context)),
                        _buildProjectSectionButton(
                            "companydashboard_company6".tr(),
                            Colors.black,
                            false, () {
                          context.router
                              .replace(const CompanyDashboardArchievedRoute());
                          print('Archived pressed');
                        }, Theme.of(context)),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                if (projectList.isEmpty)
                  Column(
                    children: [
                      Text(
                        "companydashboard_company7".tr() +
                            _localStorage.getString(key: StorageKey.userName)!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "companydashboard_company8".tr(),
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
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomAppBar(selectedTab: 'Dashboard'),
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
                Text("companydashboard_company9".tr() +
                    '${project.countProposal}'),
                Text("companydashboard_company10".tr() +
                    '${project.countMessages}'),
                Text("companydashboard_company11".tr() +
                    '${project.countHired}'),
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
                  "companydashboard_company12".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  Navigator.pop(context);
                  context.router.push(const CompanyProjectProposalsRoute());
                  // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  "companydashboard_company13".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  Navigator.pop(context);
                  context.router.push(const CompanyProjectMessageRoute());
                  // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text(
                  "companydashboard_company14".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  Navigator.pop(context);
                  context.router.push(const CompanyProjectHiredRoute());
                  // Close the bottom sheet
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.remove_red_eye),
                title: Text(
                  "companydashboard_company15".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  handleProjectPressed(project, context);
                  Navigator.pop(context);
                  context.router.push(const CompanyProjectDetailRoute());
                  // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text(
                  "companydashboard_company16".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  // Add logic to edit posting
                  print('Edit Posting');
                  Navigator.pop(context);
                  _showEditDialog(context, project);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text(
                  "companydashboard_company17".tr(),
                  style: TextStyle(fontSize: 16, height: 1.2),
                ),
                onTap: () {
                  deleteProject(project.projectId ?? -1);
                  print('Delete Posting');
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.play_arrow),
                title: Text(
                  "companydashboard_company18".tr(),
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

  Widget _buildProjectSectionButton(
    String label,
    Color color,
    bool isBlue,
    VoidCallback onPressed,
    ThemeData theme,
  ) {
    final buttonColor = isBlue
        ? theme.colorScheme.primaryContainer
        : theme.colorScheme.secondary;
    final textColor = isBlue
        ? theme.colorScheme.onPrimaryContainer
        : theme.colorScheme.onSecondary;

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            label,
            style: TextStyle(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, ProjectOutput project) {
    // Define project details variables
    int projectScopeFlag = project.projectScopeFlag ?? -1; // Default value
    String projectTitle = ''; // Empty string
    String projectDescription = ''; // Empty string
    int numberOfStudents = -1; // Default value

    // Options for project scope
    List<String> scopeOptions = [
      'Less than one month',
      'One to three months',
      'Three to six months',
      'More than six months',
    ];
    // Create a dropdown value for the selected scope
    String selectedScope = scopeOptions[projectScopeFlag];

    showDialog(
      context: context,
      builder: (context) {
        String newValue;

        return AlertDialog(
          title: Text('Edit Project'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Keep the fields empty to keep the current values'),
              // Input field for project title
              Tooltip(
                message: 'Leave empty to keep current title',
                child: TextField(
                  onChanged: (value) {
                    projectTitle = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Project Title',
                  ),
                ),
              ),
              // Input field for project description
              Tooltip(
                message: 'Leave empty to keep current description',
                child: TextField(
                  onChanged: (value) {
                    projectDescription = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Project Description',
                  ),
                ),
              ),
              // Input field for number of students
              Tooltip(
                message: 'Leave empty to keep current number of students',
                child: TextField(
                  onChanged: (value) {
                    numberOfStudents = int.tryParse(value) ?? 0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number of Students',
                  ),
                ),
              ),
              SizedBox(height: 10)
              ,
              //text field for project scope
              const Align(
                alignment: Alignment.centerLeft, // Align to the left side
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0), // Add top padding for spacing
                  child: Text(
                    'Choose your desired project Scope',
                    style: TextStyle(
                        fontSize: 16), // Adjust the font size as needed
                  ),
                ),
              ),

              DropdownButtonFormField<String>(
                value: selectedScope,
                onChanged: (newValue) {
                  
                  setState(() {
                    print('New value: $newValue');
                    print('Index: ${scopeOptions.indexOf(newValue!)}');
                    selectedScope = newValue;
                    projectScopeFlag = scopeOptions.indexOf(selectedScope);
                  });
                },
                onSaved: (newValue) {
                  
                  setState(() {
                    selectedScope = newValue!;
                    projectScopeFlag = scopeOptions.indexOf(selectedScope);
                  });
                },
                items: scopeOptions.map((String scope) {
                  return DropdownMenuItem<String>(
                    value: scope,
                    child: Text(scope),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // anything empty will become that of the project
                final form = ProjectPostForm().copyWith(
                  companyId: project.companyId,
                  title: projectTitle.isEmpty ? project.title : projectTitle,
                  description: projectDescription.isEmpty
                      ? project.description
                      : projectDescription,
                  projectScopeFlag: projectScopeFlag,
                  numberOfStudents: numberOfStudents == -1
                      ? project.numberOfStudents
                      : numberOfStudents,
                );
                handleEditProject(form, project.projectId ?? -1);

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without saving
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
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
    showSnackBarSuccess(
        context, 'Project started, check active tab for details!');
  }

  Future<void> deleteProject(int projectId) async {
    await context.read<CompanyDashboardCubit>().deleteProject(projectId);
    showSnackBarSuccess(
        context,
        context.read<CompanyDashboardCubit>().state.message ??
            'Failed to delete project!');
  }

  Future<void> handleEditProject(ProjectPostForm project, int projectId) async {
    await context.read<CompanyDashboardCubit>().editProject(project, projectId);
    showSnackBarSuccess(
        context,
        context.read<CompanyDashboardCubit>().state.message ??
            'Project update failed!');
  }
}
