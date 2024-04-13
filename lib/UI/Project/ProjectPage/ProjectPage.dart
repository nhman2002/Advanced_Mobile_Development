import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';


class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: 200, // Adjust leading width for the text
        automaticallyImplyLeading: true, // This will enable the back button
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                // Implement back button logic
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            SizedBox(
                width: 10), // Add some spacing between the back button and text
            Text(
              'Saved Projects',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Implement route logic here
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 40.0),
          ),
        ],
      ),
      body: Center(
        // Wrap the Column with Center widget
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProjectItem(context, createdDay: 3),
                      _buildProjectItem(context, createdDay: 5),
                    ],
                  ),
                ),
              ),
              // Spacer(),

              Align(
                alignment: Alignment.center,
                child: OverflowBar(
                  children: [
                    _buildDashboardItem(Icons.work, 'Projects', Colors.black
                    ),
                    _buildDashboardItem(Icons.dashboard, 'Dashboard',
                        Colors.white),
                    _buildDashboardItem(
                        Icons.message, 'Message', Colors.white),
                    _buildDashboardItem(Icons.notifications, 'Alerts',
                        Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDashboardItem(
      IconData icon, String label, Color? color) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, routePath);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProjectItem(BuildContext context, {required int createdDay}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Created $createdDay days ago',
                    style: TextStyle(color: Colors.grey),
                  ),

                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Senior frontend developer (Fintech)',
                        style: TextStyle(color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement favorite logic here
                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Time: 1-3 months, 6 students needed',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Students are looking for:',
                    style: TextStyle(color: Colors.black),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Proposals: Less than 5',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
        Divider(),

      ],
    );
  }
}
