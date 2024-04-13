import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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

class InputProfileExperience extends StatefulWidget {
  const InputProfileExperience({Key? key}) : super(key: key);

  @override
  _InputProfileExperienceState createState() =>
      _InputProfileExperienceState();
}

class _InputProfileExperienceState extends State<InputProfileExperience> {
  // Initialize MultiSelectController

  List<Project> projectList = [
    Project(
      id: '1',
      projectName: 'Intelligent Taxi Dispatching system',
      period: '9/2020 - 12/2020, 4 months',
      description:
          'It is the developer of a super-app for ride-hailing, food delivery, and digital payments services on mobile devices that operates in Singapore, Malaysia, ..',
    ),
    Project(
      id: '2',
      projectName: 'Intelligent Taxi Dispatching system',
      period: '9/2020 - 12/2020, 4 months',
      description:
          'It is the developer of a super-app for ride-hailing, food delivery, and digital payments services on mobile devices that operates in Singapore, Malaysia, ..',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Tell us about yourself and you will be on your way to connect with real-world projects",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.projectName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                project.period,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit_outlined),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete_outlined),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(project.description),
                      SizedBox(height: 15),
                      // MultiSelectChipField with onSelectionChanged callback
                      MultiSelectChipField(
                        items: skillSetList
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        initialValue: [],
                      
                      ),
                      SizedBox(height: 20),
                      Divider(),
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
                  child: Text('Next', style: TextStyle(color: Colors.white)),
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
    home: InputProfileExperience(),
  ));
}
