import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/UI/company/widget/ProjectSectionButton.dart';
import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class CompanyDashboardArchieved extends StatefulWidget {
  const CompanyDashboardArchieved({super.key});

  @override
  State<CompanyDashboardArchieved> createState() =>
      _CompanyDashboardArchieved();
}

final _localStorage = getIt.get<LocalStorage>();

class _CompanyDashboardArchieved extends State<CompanyDashboardArchieved>
    with SnackBarDefault {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
      builder: (context, state) {
        //filter out project with typeflag = 1
        final projectList = state.projectList
            .where((element) => element.typeFlag == 2)
            .toList();

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
                      "companydashboard_company1".tr(),
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildProjectSectionButton(
                          "companydashboard_company4".tr(), Colors.black, false,
                          () {
                        context.router.replace(const CompanyDashboardRoute());
                        print('All Projects pressed');
                      }, Theme.of(context)),
                      buildProjectSectionButton(
                          "companydashboard_company5".tr(), Colors.black, false,
                          () {
                        context.router
                            .replace(const CompanyDashboardWorkingRoute());
                        print('Active pressed');
                      }, Theme.of(context)),
                      buildProjectSectionButton(
                          "companydashboard_company6".tr(), Colors.black, true,
                          () {
                        // Add onPressed logic here
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
                       "No Archived Projects",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
          bottomNavigationBar: const CustomBottomAppBar(),
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
                  context.router.push(const CompanyProjectProposalsRoute());
                  Navigator.pop(context); // Close the bottom sheet
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
                  context.router.push(const CompanyProjectMessageRoute());
                  Navigator.pop(context); // Close the bottom sheet
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
                  context.router.push(const CompanyProjectHiredRoute());
                  Navigator.pop(context); // Close the bottom sheet
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
                  context.router.push(const CompanyProjectDetailRoute());
                  Navigator.pop(context); // Close the bottom sheet
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
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text(
                  "companydashboard_company17".tr(),
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
}
