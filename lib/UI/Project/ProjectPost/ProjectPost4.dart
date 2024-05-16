import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:easy_localization/easy_localization.dart';


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
        title: Text("projectpost4_project1".tr()),
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
                    "projectpost4_project2".tr(),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    state.title ?? "projectpost4_project3".tr(),
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Divider(
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
                            "projectpost4_project4".tr(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state.projectScopeFlag == 0
                                ? "projectpost2_project5".tr()
                                : state.projectScopeFlag == 1
                                    ? "projectpost2_project6".tr()
                                    : state.projectScopeFlag == 2
                                        ? "projectpost2_project7".tr()
                                        : "projectpost2_project8".tr()
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
                            "projectpost4_project5".tr(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\u2022 ${state.numberOfStudents}' + "projectpost4_project6".tr(),
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
                          print("projectpost4_project7".tr() + '${state.projectScopeFlag}');
                          print("projectpost4_project8".tr() + '${projectDescribe.text}');
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
                        child: Text("projectpost4_project9".tr()),
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
      showSnackBarSuccess(context, "projectpost4_project10".tr());
      context.router.popUntilRoot();
      context.router.replace(const CompanyDashboardWrapperRoute());
    } else {
      showSnackBarError(context, message);
    }
  }
}
