import 'package:flutter/material.dart';

void main() {
  runApp(ProjectPosting());
}

class ProjectPosting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProjectPosting3(),
      ),
    );
  }
}

class ProjectPosting3 extends StatefulWidget {
  @override
  _ProjectPosting3State createState() => _ProjectPosting3State();
}

class _ProjectPosting3State extends State<ProjectPosting3> {
  int step = 3;
  String errorMessage = '';
  final projectDescribe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "3/4    Next, provide project description",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Student are looking for: ",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Clear expectation about your project or deliverables",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "The skills required for your project",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022 ',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Details about your project ",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            "Describe your project: ",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: projectDescribe,
            maxLines: 7,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color(0xFF008ABD)),
                ),
                hintText: "Description..."),
            onChanged: (value) {
              setState(() {
                errorMessage = '';
              });
            },
          ),
          SizedBox(
            height: 14,
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (projectDescribe.text.isNotEmpty) {
                    setState(() {
                      step++;
                    });
                    setState(() {
                      errorMessage = '';
                    });
                  } else {
                    setState(() {
                      errorMessage = "Please fill this field";
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
                child: const Text('Review your post'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
