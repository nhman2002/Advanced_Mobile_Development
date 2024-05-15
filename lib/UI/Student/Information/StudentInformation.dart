import 'package:flutter/material.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

class StudentInformationScreen extends StatelessWidget {

   StudentInformationScreen({Key? key}) : super(key: key);


var student = StudentProfile().copyWith(
  id: 147,
  userId: 439,
  fullname: "em ien dep trai",
  techStack: [TechStack(
    id: 3,
    createdAt: "2024-04-08T00:58:11.228Z",
    updatedAt: "2024-04-08T00:58:11.228Z",
    deletedAt: null,
    name: "Backend Developer",
  ),]
  resume: "resumes/1715260407352-20126064.pdf",
  transcript: null,
  skillSets: [
    SkillSet(
      id: 2,
      createdAt: "2024-04-08T00:58:11.256Z",
      updatedAt: "2024-04-08T00:58:11.256Z",
      deletedAt: null,
      name: "C++",
    ),
    SkillSet(
      id: 4,
      createdAt: "2024-04-08T00:58:11.270Z",
      updatedAt: "2024-04-08T00:58:11.270Z",
      deletedAt: null,
      name: "Java",
    ),
  ],
  educations: [
    Education(
      id: 497,
      createdAt: "2024-05-12T14:44:15.068Z",
      updatedAt: "2024-05-12T14:44:15.068Z",
      deletedAt: null,
      studentId: 201,
      schoolName: "My School",
      startYear: 2020,
      endYear: 2024,
    ),
  ],
  experiences: [
    Experience(
      id: 371,
      createdAt: "2024-05-12T22:47:50.334Z",
      updatedAt: "2024-05-12T22:47:50.334Z",
      deletedAt: null,
      studentId: 201,
      title: "cool",
      startMonth: "06-2021",
      endMonth: "09-2023",
      description: "being so cool",
      skillSets: [
        SkillSet(
          id: 1,
          createdAt: "2024-04-08T00:58:11.238Z",
          updatedAt: "2024-04-08T00:58:11.238Z",
          deletedAt: null,
          name: "C",
        ),
      ],
    ),
  ],
  languages: [
    Language(
      id: 912,
      createdAt: "2024-05-12T22:48:27.723Z",
      updatedAt: "2024-05-12T22:48:27.723Z",
      deletedAt: null,
      studentId: 201,
      languageName: "engrish",
      level: "high",
    ),
  ],
);





  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Profile",
          style: theme.textTheme.headline6,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 70,
                  clipBehavior: Clip.none,
                  width: 70,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('lib/common/ui/assets/circle_avatar.png'),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.fullname ?? '',
                      style: theme.textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Tech Stack: ${student.techStackName ?? "No data"}',
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'Project Title: ${student.proposals.isNotEmpty ? student.proposals[0].projectId.toString() : "No data"}',
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Cover Letter: ${student.proposals.isNotEmpty ? student.proposals[0].coverLetter : "No data"}',
              style: theme.textTheme.bodyText1,
            ),
            SizedBox(height: 20),
            Text(
              "Tech Stack",
              style: theme.textTheme.bodyText1!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Education",
              style: theme.textTheme.bodyText1!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'School Name: ${student.educations.isNotEmpty ? student.educations[0].schoolName : "No data"}',
              style: theme.textTheme.bodyText2,
            ),
            Text(
              'Start Year: ${student.educations.isNotEmpty ? student.educations[0].startYear.toString() : "No data"}',
              style: theme.textTheme.bodyText2,
            ),
            Text(
              'End Year: ${student.educations.isNotEmpty ? student.educations[0].endYear.toString() : "No data"}',
              style: theme.textTheme.bodyText2,
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Resume",
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'lib/common/ui/assets/pdf.png',
                          scale: 1.8,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Resume.pdf', // Replace with actual data
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transcript",
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'lib/common/ui/assets/pdf.png',
                          scale: 1.8,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transcript.pdf', // Replace with actual data
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            SizedBox(height: 4),
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
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Hub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentInformationScreen(student StudentProfile()),
    );
  }
}
}
