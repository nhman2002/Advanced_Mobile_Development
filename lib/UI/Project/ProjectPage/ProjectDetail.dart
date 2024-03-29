import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

class ProjectDetail extends StatefulWidget {
  @override
  _ProjectDetail createState() => _ProjectDetail();
}

class _ProjectDetail extends State<ProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 40.0),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project detail',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Make the text bold
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Title of the Job',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold, // Make the text bold
                          fontSize: 20.0),
                    ),
                    SizedBox(height: 25),
                    Divider(),
                    SizedBox(height: 25),
                    Text(
                      'Students are looking for:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.remove,
                                size: 10.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  width:
                                      5), // Adjust spacing between icon and text
                              Expanded(
                                child: Text(
                                  'Clear expectation about your project or deliverables.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove,
                                size: 10.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  width:
                                      5), // Adjust spacing between icon and text
                              Expanded(
                                child: Text(
                                  'The skills require for your project.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove,
                                size: 10.0,
                                color: Colors.black,
                              ),
                              SizedBox(
                                  width:
                                      5), // Adjust spacing between icon and text
                              Expanded(
                                child: Text(
                                  'Detail about yoru project.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Divider(),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 40.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Project scope:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                        width:
                                            5), // Adjust spacing between icon and text
                                    Expanded(
                                      child: Text(
                                        '3 to 6 month',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 40.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Student required:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                        width:
                                            5), // Adjust spacing between icon and text
                                    Expanded(
                                      child: Text(
                                        '6 students',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Apply Now button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Apply Now button logic
                  },
                  child: Text('Apply Now'),
                ),
              ),
            ),
            // Saved button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Saved button logic
                  },
                  child: Text('Saved'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
