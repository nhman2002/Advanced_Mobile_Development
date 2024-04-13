import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Language {
  final String id;
  final String text;

  Language({required this.id, required this.text});
}

class Education {
  final String id;
  final String schoolName;
  final String period;

  Education({required this.id, required this.schoolName, required this.period});
}

class InputProfileTechStackScreen extends StatefulWidget {
  const InputProfileTechStackScreen({Key? key}) : super(key: key);

  @override
  State<InputProfileTechStackScreen> createState() => _InputProfileTechStackScreenState();
}

class _InputProfileTechStackScreenState extends State<InputProfileTechStackScreen> {
  final List<String> items = [
    'Front-end Engineer',
    'Back-end Engineer',
    'Fullstack Engineer',
    'Java Engineer',
    'Quality Engineer',
    'Business Analyst',
    'Scrum Master',
    'Principal Engineer',
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

  List<Language> languageList = [];
  List<Education> educationList = [
    Education(id: '1', schoolName: 'Le Hong Phong High School', period: '2008-2010'),
    Education(id: '2', schoolName: 'Ho Chi Minh University of Sciences', period: '2010-2014'),
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController languagesTextEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Profile Tech Stack'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to Student Hub", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text("Tell us about yourself and you will be on your way connect with real-world project", style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              Text("Techstack", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                isExpanded: true,
                hint: Text("Select your main techstack"),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text("Skillset", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              MultiSelectChipField(
                items: skillSetList.map((skill) => MultiSelectItem<String>(skill, skill)).toList(),
                initialValue: [],
                onTap: (values) {
                  // Handle selected values
                },
              ),
              SizedBox(height: 20),
              Text("Languages", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(languageList[index].text),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          languageList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text("Education", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: educationList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(educationList[index].schoolName),
                    subtitle: Text(educationList[index].period),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          educationList.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to next screen or perform action
                },
                child: Text('Next'),
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
    home: InputProfileTechStackScreen(),
  ));
}
