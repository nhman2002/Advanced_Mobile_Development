import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

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
        title: Text('Project Post - Step 2'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2/4    Next, estimate the scope of your job",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Consider the size of your project and the timeline",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              "How long will your project take ?",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                CheckboxListTile(
                  title: Text('Less than 1 month'),
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
                  title: Text('1 to 3 months'),
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
                  title: Text('3 to 6 months'),
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
                  title: Text('More than 6 months'),
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
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                  : SizedBox(),
            ),
            Text(
              "How many students do you want for this project ?",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF008ABD),
                  ),
                ),
                hintText: 'Number of students',
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
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    )
                  : SizedBox(),
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
                            ? "Please choose a project time"
                            : '';
                        errorMessage2 = studentNum == 0
                            ? "Please fill this field!"
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
                  child: const Text('Next: Description'),
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

