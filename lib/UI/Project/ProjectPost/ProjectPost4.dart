import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class ProjectPosting4 extends StatefulWidget  {
  const ProjectPosting4({Key? key}) : super(key: key);

  @override
  _ProjectPosting4State createState() => _ProjectPosting4State();
}

class _ProjectPosting4State extends State<ProjectPosting4> with SnackBarDefault {
  TextEditingController projectDescribe = TextEditingController();
  TextEditingController studentNum = TextEditingController();
  String projectTime = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Details'),
      ),
      body: BlocBuilder<ProjectPostCubit, ProjectPostState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4/4    Project details",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    state.title ?? 'not found',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Divider(
                    color: Color.fromARGB(255, 130, 130, 130),
                    height: 0.5,
                  ),
                  SizedBox(height: 16),
                  Text(
                    state.description ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 18),
                  Divider(
                    color: Color.fromARGB(255, 130, 130, 130),
                    height: 0.5,
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm_rounded,
                        size: 34,
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project scope",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state.projectScopeFlag == 0
                                ? "Less than 1 month"
                                : state.projectScopeFlag == 1
                                    ? "1-3 months"
                                    : state.projectScopeFlag == 2
                                        ? "3-6 months"
                                        : "More than 6 months"
                            ,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      Icon(
                        Icons.people_outline_rounded,
                        size: 34,
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Students required",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\u2022 ${state.numberOfStudents} students",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Project time: ${state.projectScopeFlag}");
                          print("Describe: ${projectDescribe.text}");
                          handleProjectPost();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008ABD),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Post job'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> handleProjectPost() async {
    // popuntil root
    await context.read<ProjectPostCubit>().handleProjectPost(
          context.read<ProjectPostCubit>().state.projectScopeFlag!,
          context.read<ProjectPostCubit>().state.title!,
          context.read<ProjectPostCubit>().state.numberOfStudents!,
          context.read<ProjectPostCubit>().state.description!,
        );
    final isSuccess = await context.read<ProjectPostCubit>().state.postSuccess;
    final message = await context.read<ProjectPostCubit>().state.message ?? '';
    if (isSuccess) {
      showSnackBarSuccess(context, 'Project posted successfully!');
      context.router.popUntilRoot();
      context.router.replace(const CompanyDashboardWrapperRoute());
    } else {
      showSnackBarError(context, message);
    }
  }
}
