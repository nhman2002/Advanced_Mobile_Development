import 'package:flutter/material.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/core/models/output/project_model.dart'; // Import BlocBuilder
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class FavoriteProjectPage extends StatefulWidget {
  const FavoriteProjectPage({super.key});

  @override
  _FavoriteProjectPageState createState() => _FavoriteProjectPageState();
}

class _FavoriteProjectPageState extends State<FavoriteProjectPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Set a delay to hide the loading indicator after 5 seconds
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListCubit, ProjectListState>(
      builder: (context, state) {
        final projectList = state.favoriteProjectList; // Wrap with BlocBuilder
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 200, // Adjust leading width for the text
            automaticallyImplyLeading: true, // This will enable the back button
            titleSpacing: NavigationToolbar.kMiddleSpacing,
            leading: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Implement back button logic
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                    width:
                        10), // Add some spacing between the back button and text
                const Text(
                  'Saved Projects',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Implement route logic here
                },
                icon:
                    const Icon(Icons.account_circle, size: 40.0),
              ),
            ],
          ),
          body: Center(
            // Wrap the Column with Center widget
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (projectList.isNotEmpty)
                            SingleChildScrollView(
                              child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 20,
                                ),
                                child: Column(
                                  children: projectList.map((project) {
                                    return _buildProjectItem(context, project);
                                  }).toList(),
                                ),
                              ),
                            )
                          else
                            // Show a loading circle if the project list is empty
                            // The circle dissapears after 5 sec and a message is displayed
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(height: 50),
                                  Center(
                                    child: isLoading
                                        ? const CircularProgressIndicator()
                                        : Text("savedprojectpage_student1".tr()),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget _buildProjectItem(BuildContext context, ProjectOutput project) {
    DateTime createdAt =
        DateTime.parse(project.createdAt ?? DateTime.now().toString());
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    int daysAgo = difference.inDays;
    int id = project.projectId ?? 0;
    String projectScope = {
          0: 'Less than 1 month',
          1: '1-3 months',
          2: '3-6 months',
          3: 'More than 6 months',
        }[project.projectScopeFlag] ??
        'Unknown';

    String proposal = '';
    if (project.countProposal! < 5) {
      proposal = 'Less than 5';
    } else if (project.countProposal! < 100) {
      proposal = '${project.countProposal}';
    } else {
      proposal = 'More than 100';
    }

    return
    Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${"projectlist_student3".tr()}$daysAgo${"projectlist_student4".tr()}',
            style: const TextStyle(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  project.title ?? "projectlist_student5".tr(),
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow
                      .ellipsis, // Add this line to handle long titles
                  maxLines: 1, // Add this line to limit the title to one line
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            '${"projectlist_student6".tr()}$projectScope, ${project.numberOfStudents}${"projectlist_student7".tr()}',
            style: const TextStyle(),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.remove,
                size: 16.0,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  project.description ?? "projectlist_student8".tr(),
                  style: const TextStyle(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            '${"projectlist_student9".tr()}$proposal',
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}
