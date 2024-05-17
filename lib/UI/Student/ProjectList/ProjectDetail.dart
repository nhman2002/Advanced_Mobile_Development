import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class StudentProjectDetail extends StatefulWidget {
  const StudentProjectDetail({super.key});

  @override
  _StudentProjectDetailState createState() => _StudentProjectDetailState();
}

class _StudentProjectDetailState extends State<StudentProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the login page
              // Navigator.pushNamed(context, context.router.push(const LoginPageRoute()) as String);
            },
            icon: const Icon(Icons.account_circle, size: 40.0),
          )
        ],
      ),
      body: BlocBuilder<ProjectListCubit, ProjectListState>(
        builder: (context, state) {
            // Assuming you have only one project for now
            final project = state.clickedProject;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "projectdetail_student1".tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            project?.title ?? "projectdetail_student2".tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          const SizedBox(height: 25),
                          const Divider(),
                          const SizedBox(height: 25),
                          Text(
                            project?.description ?? "projectdetail_student3".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Divider(),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Icon(
                                Icons.alarm,
                                size: 40.0,
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "projectdetail_student4".tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.remove,
                                            size: 10.0,
                                          ),
                                          const SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              project?.projectScopeFlag == 0 ? "projectdetail_student5".tr() : "projectdetail_student6".tr(),
                                              style: const TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              const Icon(
                                Icons.people,
                                size: 40.0,
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "projectdetail_student7".tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.remove,
                                            size: 10.0,
                                          ),
                                          const SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              '${project?.numberOfStudents}${"projectdetail_student8".tr()}',
                                              style: const TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const CoverLetterPageRoute());
                  },
                  child: Text("projectdetail_student9".tr()),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Saved button logic
                  },
                  child: Text("projectdetail_student10".tr()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
