import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectDetail.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class StudentProjectList extends StatefulWidget {
  const StudentProjectList({super.key});

  @override
  State<StudentProjectList> createState() => _StudentProjectList();
}

class _StudentProjectList extends State<StudentProjectList> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Set a delay to hide the loading indicator after 5 seconds
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListCubit, ProjectListState>(
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
                  icon: Icon(Icons.account_circle,
                      color: Colors.white, size: 40.0),
                )
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
                    Row(
                      children: [
                        Expanded(
                          child: SearchAnchor(
                            builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                controller: controller,
                                padding:
                                    const MaterialStatePropertyAll<EdgeInsets>(
                                        EdgeInsets.symmetric(horizontal: 16.0)),
                                onTap: () {
                                  // controller.openView();
                                },
                                onChanged: (_) {
                                  controller.openView();
                                },
                                leading: const Icon(Icons.search),
                                trailing: <Widget>[
                                  Tooltip(
                                    message: "projectlist_student1".tr(),
                                  ),
                                ],
                              );
                            },
                            suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
                              return List<ListTile>.generate(5, (int index) {
                                final String item = 'item $index';
                                return ListTile(
                                  title: Text(item),
                                  onTap: () {
                                    setState(() {
                                      controller.closeView(item);
                                    });
                                  },
                                );
                              });
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<ProjectListCubit>()
                                .initFavoriteProject();
                            context.router
                                .push(const FavoriteProjectPageRoute());
                          },
                          icon: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (projectList.isNotEmpty)
                              SingleChildScrollView(
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 20,
                                  ),
                                  child: Column(
                                    children: projectList.map((project) {
                                      return _buildProjectItem(
                                          context, project);
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
                                    SizedBox(height: 50),
                                    Center(
                                      child: isLoading
                                          ? CircularProgressIndicator()
                                          : Text("projectlist_student2".tr()),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            //   bottomNavigationBar: BottomAppBar(
            //     color: Colors.blue,
            //     child: Center(
            //       child: Padding(
            //         padding: const EdgeInsets.all(0),
            //         child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             _buildCompanyDashboardItem(
            //               Icons.work, "studentdashboard_student7".tr(), Colors.black, Colors.grey.shade300),
            //             _buildCompanyDashboardItem(
            //               Icons.dashboard, "studentdashboard_student8".tr(), Colors.white, Colors.blue.shade300),
            //             _buildCompanyDashboardItem(
            //               Icons.message, "studentdashboard_student9".tr(), Colors.white, Colors.blue.shade300),
            //             _buildCompanyDashboardItem(
            //               Icons.notifications, "studentdashboard_student10".tr(), Colors.white, Colors.blue.shade300),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            );
      },
    );
  }

  // Widget _buildCompanyDashboardItem(
  //     IconData icon, String label, Color color, Color bgColor) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.blue,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
  //     child: AnimatedButton(
  //       icon: icon,
  //       label: label,
  //       color: color,
  //       bgColor: bgColor,
  //       onPressed: () {
  //         // Add onPressed logic here
  //         if (label == "studentdashboard_student7".tr()) {
  //           // context.router.push(const StudentSignupRoute());
  //         } else if (label == "studentdashboard_student8".tr()) {
  //           context.router.replace(const StudentDashBoardWrapperRoute());
  //         } else if (label == "studentdashboard_student9".tr()) {
  //           context.router.replace(const MessageListScreenRoute());
  //         } else if (label == "studentdashboard_student10".tr()) {
  //           context.router.replace(const StudentSignupRoute());
  //         }
  //       },
  //     ),
  //   );
  // }

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

    return GestureDetector(
      onTap: () {
        handleProjectDetail(id);
        print('Project $id tapped');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "projectlist_student3".tr() +
                  '$daysAgo' +
                  "projectlist_student4".tr(),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    project.title ?? "projectlist_student5".tr(),
                    style: TextStyle(color: Colors.green, fontSize: 20),
                    overflow: TextOverflow
                        .ellipsis, // Add this line to handle long titles
                    maxLines: 1, // Add this line to limit the title to one line
                  ),
                ),
                FavoriteIconButton(projectId: project.projectId ?? -1)
              ],
            ),
            SizedBox(height: 5),
            Text(
              "projectlist_student6".tr() +
                  '$projectScope, ${project.numberOfStudents}' +
                  "projectlist_student7".tr(),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.remove,
                  size: 16.0,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    project.description ?? "projectlist_student8".tr(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "projectlist_student9".tr() + '$proposal',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleProjectDetail(int projectId) async {
    context.read<ProjectListCubit>().projectClicked(projectId);
    await context.read<ProjectListCubit>().getProject(projectId);
    context.router.push(const StudentProjectDetailRoute());
  }
}

class FavoriteIconButton extends StatefulWidget {
  final int projectId;
  const FavoriteIconButton({Key? key, required this.projectId})
      : super(key: key);

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton>
    with SnackBarDefault {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Check if the project is in the list of favorite projects
    _isFavorite =
        context.read<ProjectListCubit>().isProjectFavorite(widget.projectId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectListCubit, ProjectListState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (_isFavorite == false) {
              context
                  .read<ProjectListCubit>()
                  .addFavoriteProject(widget.projectId);
              showSnackBarSuccess(context, "projectlist_student10".tr());
            } else {
              context
                  .read<ProjectListCubit>()
                  .removeFavoriteProject(widget.projectId);
              showSnackBarWarning(context, "projectlist_student11".tr());
            }

            setState(() {
              _isFavorite = !_isFavorite; // Toggle the favorite state
            });
          },
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
