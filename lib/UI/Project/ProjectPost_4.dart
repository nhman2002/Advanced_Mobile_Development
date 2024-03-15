import 'package:flutter/material.dart';

void main() {
  runApp(ProjectPosting());
}

class ProjectPosting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProjectPosting4(),
      ),
    );
  }
}

class ProjectPosting4 extends StatefulWidget {
  @override
  _ProjectPosting4State createState() => _ProjectPosting4State();
}

class _ProjectPosting4State extends State<ProjectPosting4> {
  TextEditingController jobTitle = TextEditingController();
  TextEditingController projectDescribe = TextEditingController();
  TextEditingController studentNum = TextEditingController();
  String projectTime = '';

  @override
  Widget build(BuildContext context) {
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
              jobTitle.text,
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
              "Student are looking for ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              "    \u2022  Clear expectation about your project or deliverables",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 2),
            Text(
              "    \u2022   The skills required for your project",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 2),
            Text(
              "    \u2022   Details about your project:",
              style: TextStyle(fontSize: 15),
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
                      "\u2022 $projectTime months",
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
                      "Student required",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "\u2022 ${studentNum.text} students",
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
        print("Job title: " + jobTitle.text);
        print("Project time: " + studentNum.text);
        print("Describe: " + projectDescribe.text);
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
  }
}
