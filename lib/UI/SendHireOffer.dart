import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkingProjects extends StatefulWidget {
  const WorkingProjects({super.key});

  @override
  State<WorkingProjects> createState() => _WorkingProjects();
}

class _WorkingProjects extends State<WorkingProjects> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Student Hub'),
          actions: [
            IconButton(
              onPressed: () {
                // Add onPressed logic here
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Senior frontend developer (Fintech)',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProjectSectionButton('Proposals', Colors.white, true),
                  _buildProjectSectionButton('Detail', Colors.black, false),
                  _buildProjectSectionButton('Message', Colors.black, false),
                  _buildProjectSectionButton('Hired', Colors.black, false),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 600,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(
                        "Hung Le",
                        "4th Year student",
                        "Fullstack Engineer",
                        "Excellent",
                        "I have somthing to show"),
                    _buildContent("BRO PLAYER", "3th Year student",
                        "Backend Engineer", "Good", "Bla Bla Bla Bla Bla"),
                    // _buildContent(),
                    // _buildContent(),
                    // _buildContent(),
                    // _buildContent(),
                  ],
                )),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.blue,
        //   child: Center(
        //     child: Padding(
        //       padding: const EdgeInsets.all(0),
        //       child: Row(
        //         children: [
        //           _buildCompanyDashboardItem(Icons.work, 'Projects',
        //               Colors.white, Colors.blue.shade300),
        //           _buildCompanyDashboardItem(Icons.dashboard, 'Dashboard',
        //               Colors.black, Colors.grey.shade300),
        //           _buildCompanyDashboardItem(Icons.message, 'Message',
        //               Colors.white, Colors.blue.shade300),
        //           _buildCompanyDashboardItem(Icons.notifications, 'Alerts',
        //               Colors.white, Colors.blue.shade300),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget _buildContent(
      String name, String year, String pos, String grade, String des) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon representing a person
              Icon(
                Icons.person,
                size: 40,
                // You can adjust color and other properties as needed
              ),
              SizedBox(width: 10), // Adjust spacing between icon and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First row with name and year
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    year,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5), // Add some vertical space between rows
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Job title
                  Row(
                    children: [
                      Text(
                        pos,
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(width: 150), // Add an indent of 30px
                      Text(
                        grade,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10), // Add some vertical space between sections
          Text(
            des,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5), // Add some vertical space between sections
          Row(
            children: [
              // Button for Message
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add onPressed logic for Message button
                  },
                  child: Text('Message'),
                ),
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              // Button for Hire
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Add onPressed logic for Hire button
                  },
                  child: Text('Hire'),
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Add some vertical space between sections
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectSectionButton(String label, Color color, bool isBlue) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isBlue ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          label,
          style: TextStyle(color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
