import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

// missing experience

class Project {
  final String id;
  final String projectName;
  final String period;
  final String description;

  Project({
    required this.id,
    required this.projectName,
    required this.period,
    required this.description,
  });
}

@RoutePage()
class StudentProfileInputExperience extends StatefulWidget {
  const StudentProfileInputExperience({Key? key}) : super(key: key);

  @override
  _StudentProfileInputExperienceState createState() =>
      _StudentProfileInputExperienceState();
}

class _StudentProfileInputExperienceState
    extends State<StudentProfileInputExperience> {
  // Initialize MultiSelectController

  List<Project> projectList = [
    Project(
      id: '1',
      projectName: "studentprofileinput2_ProfileCreation1".tr(),
      period: "studentprofileinput2_ProfileCreation2".tr(),
      description: "studentprofileinput2_ProfileCreation3".tr(),
    ),
    Project(
      id: '2',
      projectName: "studentprofileinput2_ProfileCreation1".tr(),
      period: "studentprofileinput2_ProfileCreation2".tr(),
      description: "studentprofileinput2_ProfileCreation3".tr(),
    ),
  ];

  final List<String> skillSetList = [
    'iOS Developer',
    'C',
    'C++',
    'Java',
    'Kubernetes',
    'PostgreSQL',
    'Redis',
    'Android',
    'NodeJS',
    'Objective-C',
    'React Native',
    'React',
    'Video',
    'Microservices',
  ];

  void _addNewProject(String projectName, DateTime startMonth,
      DateTime endMonth, String description, List<SkillSets> skills) {
    setState(() {
      widget.user.studentUser?.experience?.add(Experience(
        id: widget.user.id!,
        title: projectName,
        startMonth: startMonth,
        endMonth: endMonth,
        description: description,
        skillSet: skills,
        duration: (widget.user.studentUser!.duration!.inHours / 24).round(),
      ));
    });
    // Add your logic here for handling the icon press
  }

  void _deleteProject(String projectName) {
    setState(() {
      widget.user.studentUser?.experience
          ?.removeWhere((project) => project.title == projectName);
    });
    // Add your logic here for handling the icon press
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("studentprofileinput2_ProfileCreation4".tr()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "studentprofileinput1_ProfileCreation1".tr(),
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  final project = projectList[index];
                  return Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           project.projectName,
                      //           style: TextStyle(fontWeight: FontWeight.bold),
                      //         ),
                              
                      //         Text(
                      //           project.period,
                      //           style: TextStyle(fontSize: 13),
                      //         )
                      //       ],
                      //     ),
                      //     Row(
                      //       children: [
                      //         IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(Icons.edit_outlined),
                      //         ),
                      //         IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(Icons.delete_outlined),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // Text(project.description),
                      // SizedBox(height: 15),
                      // // MultiSelectChipField with onSelectionChanged callback
                      // MultiSelectChipField(
                      //   items: skillSetList
                      //       .map((e) => MultiSelectItem(e, e))
                      //       .toList(),
                      //   initialValue: [],
                      // ),
                      // SizedBox(height: 20),
                      // Divider(),
                      Text(
                                "Educations",
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                    ],
                  );
                },
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to next screen
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Text("studentprofileinput1_ProfileCreation4".tr(),
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StudentProfileInputExperience(),
  ));
}
