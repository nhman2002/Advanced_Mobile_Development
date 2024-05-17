import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class ProjectPosting2 extends StatefulWidget  {
  const ProjectPosting2({super.key});

  @override
  State<ProjectPosting2> createState() => _ProjectPosting2State();
}

class _ProjectPosting2State extends State<ProjectPosting2> {
  int step = 2;
  List<bool> selectedOptions = [false, false, false, false];
  String errorMessage = '';
  String errorMessage2 = '';
  int studentNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("projectpost2_project1".tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "projectpost2_project2".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              "projectpost2_project3".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              "projectpost2_project4".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                CheckboxListTile(
                  title: Text("projectpost2_project5".tr()),
                  value: selectedOptions[0],
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      if (value!) {
                        for (int i = 0; i < selectedOptions.length; i++) {
                          if (i == 0) {
                            selectedOptions[i] = true;
                          } else {
                            selectedOptions[i] = false;
                          }
                        }
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text("projectpost2_project6".tr()),
                  value: selectedOptions[1],
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      if (value!) {
                        for (int i = 0; i < selectedOptions.length; i++) {
                          if (i == 1) {
                            selectedOptions[i] = true;
                          } else {
                            selectedOptions[i] = false;
                          }
                        }
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text("projectpost2_project7".tr()),
                  value: selectedOptions[2],
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      if (value!) {
                        for (int i = 0; i < selectedOptions.length; i++) {
                          if (i == 2) {
                            selectedOptions[i] = true;
                          } else {
                            selectedOptions[i] = false;
                          }
                        }
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text("projectpost2_project8".tr()),
                  value: selectedOptions[3],
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      if (value!) {
                        for (int i = 0; i < selectedOptions.length; i++) {
                          if (i == 3) {
                            selectedOptions[i] = true;
                          } else {
                            selectedOptions[i] = false;
                          }
                        }
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: errorMessage.isNotEmpty
                  ? Text(
                      errorMessage,
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
            ),
            Text(
              "projectpost2_project9".tr(),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                  ),
                ),
                hintText: "projectpost2_project11".tr(),
              ),
              onChanged: (value) {
                setState(() {
                  errorMessage2 = '';
                  studentNum = int.tryParse(value) ?? 0;
                });
              },
            ),
            Container(
              alignment: Alignment.topLeft,
              child: errorMessage2.isNotEmpty
                  ? Text(
                      errorMessage2,
                      style: const TextStyle(fontSize: 16),
                    )
                  : const SizedBox(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedOptions.contains(true) && studentNum != 0) {
                      int projectTime = selectedOptions.indexOf(true);
                      next(context, projectTime, studentNum);
                    } else {
                      setState(() {
                        errorMessage = selectedOptions.contains(true)
                            ? "projectpost2_project12".tr()
                            : '';
                        errorMessage2 = studentNum == 0
                            ? "projectpost2_project13".tr()
                            : '';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF008ABD),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("projectpost2_project10".tr()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Future<void> next(BuildContext context, int projectTime, int studentNum) async {
  context.read<ProjectPostCubit>().updateProjectScopeFlag(projectTime);
  context.read<ProjectPostCubit>().updateNumberOfStudents(studentNum);
  context.router.push(const ProjectPosting3Route());
}

}

