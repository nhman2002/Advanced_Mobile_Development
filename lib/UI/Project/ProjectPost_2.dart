import 'package:flutter/material.dart';

void main() {
  runApp(ProjectPosting());
}

class ProjectPosting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProjectPosting2(),
      ),
    );
  }
}

class ProjectPosting2 extends StatefulWidget {
  @override
  _ProjectPosting2State createState() => _ProjectPosting2State();
}

class _ProjectPosting2State extends State<ProjectPosting2> {
  int step = 2;
  String projectTime = '';
  String errorMessage = '';
  String errorMessage2 = '';
  final studentNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            title: Text('1 to 3 months'),
            value: '1-3',
            groupValue: projectTime,
            onChanged: (value) {
              setState(() {
                errorMessage = '';
                projectTime = value as String;
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
                projectTime = value as String;
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
                  if (projectTime.isNotEmpty && studentNum.text.isNotEmpty) {
                    setState(() {
                      errorMessage = '';
                      errorMessage2 = '';
                      step++;
                    });
                  } else {
                    setState(() {
                      errorMessage = projectTime.isEmpty
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
    );
  }
}
