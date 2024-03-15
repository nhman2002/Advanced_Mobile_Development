import 'package:flutter/material.dart';

void main() {
  runApp(ProjectPosting());
}

class ProjectPosting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProjectPosting1(),
      ),
    );
  }
}

class ProjectPosting1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int step = 1;
    String projectTime = '';
    String errorMessage = '';
    TextEditingController jobTitle = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1/4 Let's start with a strong title",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          const Text(
            "This helps your post stand out to the right students. It's the first thing they will see, so make it impressive!",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: jobTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF008ABD), // Màu xanh khi focus
                ),
              ),
              hintText: 'Write a title for your job',
            ),
            onChanged: (value) {
              errorMessage = '';
            },
          ),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.topLeft,
            child: errorMessage.isNotEmpty
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )
                : SizedBox(),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Example titles: ",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
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
                    "Build responsive WordPress site with booking/payment functionality",
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
                    "Facebook ad specialist need for product launch",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (jobTitle.text.isNotEmpty) {
                    step++;
                    errorMessage = '';
                  } else {
                    errorMessage = "Please fill this field";
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
                child: const Text('Next: Scope'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
