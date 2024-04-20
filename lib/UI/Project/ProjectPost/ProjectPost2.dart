import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class ProjectPost2Page extends BaseWidget<ProjectPostCubit, ProjectPostState>{
  const ProjectPost2Page({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const ProjectPosting2();
  }

  @override
  ProjectPostCubit? provideCubit(BuildContext context) {
    return ProjectPostCubit();
  }
}
class ProjectPosting2 extends StatefulWidget  {
  const ProjectPosting2({super.key});

  @override
  State<ProjectPosting2> createState() => _ProjectPosting2State();
}

class _ProjectPosting2State extends State<ProjectPosting2> {
  int step = 2;
  int projectTime = -1;
  String errorMessage = '';
  String errorMessage2 = '';
  final studentNum = TextEditingController();

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
            RadioListTile(
              title: Text('Less than 1 month'),
              value: 'Less than 1 month',
              groupValue: projectTime,
              onChanged: (value) {
                setState(() {
                  errorMessage = '';
                  projectTime = 0;
                });
              },
              selected: projectTime == 'Less than 1 month',
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: projectTime == 'Less than 1 month'
                  ? const Color(0xFF008ABD).withOpacity(0.1)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              activeColor: const Color(0xFF008ABD),
            ),
             RadioListTile(
              title: Text('1 to 3 months'),
              value: '1-3',
              groupValue: projectTime,
              onChanged: (value) {
                setState(() {
                  errorMessage = '';
                  projectTime = 1;
                });
              },
              selected: projectTime == '1-3',
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: projectTime == '1-3'
                  ? const Color(0xFF008ABD).withOpacity(0.1)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              activeColor: const Color(0xFF008ABD),
            ),
            RadioListTile(
              title: Text('3 to 6 months'),
              value: '3-6',
              groupValue: projectTime,
              onChanged: (value) {
                setState(() {
                  errorMessage = '';
                  projectTime = 2;
                });
              },
              selected: projectTime == '3-6',
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: projectTime == '3-6'
                  ? const Color(0xFF008ABD).withOpacity(0.1)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              activeColor: const Color(0xFF008ABD),
            ),
            
             RadioListTile(
              title: Text('More than 6 months'),
              value: 'More than 6 months',
              groupValue: projectTime,
              onChanged: (value) {
                setState(() {
                  errorMessage = '';
                  projectTime = 3;
                });
              },
              selected: projectTime == 'More than 6 months',
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: projectTime == '1-3'
                  ? const Color(0xFF008ABD).withOpacity(0.1)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              activeColor: const Color(0xFF008ABD),
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
              controller: studentNum,
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
                    if (projectTime != -1 && studentNum.text.isNotEmpty) {
                      next(context, projectTime, studentNum as int);
                    
                    } else {
                      setState(() {
                        errorMessage = projectTime != -1
                            ? "Please choose a project time"
                            : '';
                        errorMessage2 = studentNum.text.isEmpty
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
}

Future<void> next(BuildContext context, int projectTime, int studentNum) async {
  context.read<ProjectPostCubit>().updateProjectScopeFlag(projectTime);
  context.read<ProjectPostCubit>().updateNumberOfStudents(studentNum);
  context.router.push(const ProjectPost3PageRoute());
}