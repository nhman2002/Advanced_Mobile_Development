import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/ProjectList/ProjectDetail.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/common/ui/theme/bloc/theme.dart';
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
  SearchController _searchController = SearchController();
  TextEditingController _projectScopeController = TextEditingController();
  TextEditingController _numberOfStudentsController = TextEditingController();
  TextEditingController _proposalsLessThanController = TextEditingController();
  int? _selectedScope;
  bool isStudent = false;

  @override
  void initState() {
    super.initState();
    // Set a delay to hide the loading indicator after 10 seconds
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
        isStudent = state.isStudent ?? false;
        final projectList = state.projectList;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          appBar: AppBar(
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.replace(const SwitchAccountPageRoute());
                },
                icon: Icon(Icons.account_circle, size: 40.0),
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showFilterDialog(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                SizedBox(width: 8.0),
                                Text('Filter Projects'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isStudent)
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
                        children: [
                          if (projectList.isNotEmpty)
                            SingleChildScrollView(
                              child: Container(
                                constraints: BoxConstraints(minHeight: 20),
                                child: Column(
                                  children: projectList.map((project) {
                                    return _buildProjectItem(
                                        context, project, isStudent);
                                  }).toList(),
                                ),
                              ),
                            )
                          else
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
          ),
          bottomNavigationBar:
              const CustomBottomAppBar(selectedTab: 'Projects'),
        );
      },
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Filter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Project Scope',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                DropdownButtonFormField<int>(
                  value: _selectedScope,
                  items: [
                    DropdownMenuItem<int>(
                      value: 0,
                      child: Text('Less than 1 month'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text('1-3 months'),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text('3-6 months'),
                    ),
                    DropdownMenuItem<int>(
                      value: 3,
                      child: Text('More than 6 months'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedScope = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select Project Scope',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _numberOfStudentsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number of Students',
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _proposalsLessThanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Proposals Less Than',
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProjectListCubit>().filterProject(
                              _searchController.text,
                              _selectedScope,
                              int.tryParse(
                                  _numberOfStudentsController.text),
                              int.tryParse(
                                  _proposalsLessThanController.text),
                            );
                        Navigator.of(context).pop();
                      },
                      child: Text('Filter'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectItem(BuildContext context, ProjectOutput project,
      bool isStudent) {
    DateTime createdAt =
        DateTime.parse(project.createdAt ?? DateTime.now().toString());
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    String formattedTime = '';
    if (difference.inMinutes < 60) {
      // Less than 1 hour ago
      int minutesAgo = difference.inMinutes;
      formattedTime =
          minutesAgo == 1 ? '1 minute ago' : '$minutesAgo minutes ago';
    } else if (difference.inHours < 24) {
      // Less than 1 day ago
      int hoursAgo = difference.inHours;
      formattedTime = hoursAgo == 1 ? '1 hour ago' : '$hoursAgo hours ago';
    } else {
      // More than 1 day ago
      int daysAgo = difference.inDays;
      formattedTime = daysAgo == 1 ? '1 day ago' : '$daysAgo days ago';
    }
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
          border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.outline)), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedTime,
              style: TextStyle(),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    project.title ?? "projectlist_student5".tr(),
                    style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.tertiary),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                if (isStudent)
                  FavoriteIconButton(projectId: project.projectId ?? -1)
              ],
            ),
            SizedBox(height: 5),
            Text(
              "projectlist_student6".tr() +
                  '$projectScope, ${project.numberOfStudents}' +
                  "projectlist_student7".tr(),
              style: TextStyle(),
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.remove,
                  size: 16.0,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    project.description ?? "projectlist_student8".tr(),
                    style: TextStyle(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "projectlist_student9".tr() + '$proposal',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            // Divider(color: Theme.of(context).colorScheme.outline),
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
          ),
        );
      },
    );
  }
}
