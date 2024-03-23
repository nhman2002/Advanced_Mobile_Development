import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement route logic here
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 40.0),
          )
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
              Row(
                children: [
                  Expanded(
                    child: SearchAnchor(
                      builder:
                          (BuildContext context, SearchController controller) {
                        return SearchBar(
                          controller: controller,
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)),
                          onTap: () {
                            // controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          leading: const Icon(Icons.search),
                          trailing: <Widget>[
                            Tooltip(
                              message: 'Change brightness mode',
                            ),
                          ],
                        );
                      },
                      suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              setState(() {
                                controller.closeView(item);
                              });
                            },
                          );
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement favorite logic here
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
              // _buildProjectItem(context),
              // _buildProjectItem(context),
              // _buildProjectItem(context),
              // _buildProjectItem(context),
              // _buildProjectItem(context),
              // SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildProjectItem(context),
                      _buildProjectItem(context),
                      _buildProjectItem(context),
                      _buildProjectItem(context),
                      _buildProjectItem(context),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              Align(
                alignment: Alignment.center,
                child: OverflowBar(
                  children: [
                    _buildDashboardItem(Icons.work, 'Projects', Colors.black,
                        Routes.projectHomePage),
                    _buildDashboardItem(Icons.dashboard, 'Dashboard',
                        Colors.white, Routes.dashBoard),
                    _buildDashboardItem(
                        Icons.message, 'Message', Colors.white, Routes.login),
                    _buildDashboardItem(Icons.notifications, 'Alerts',
                        Colors.white, Routes.login),
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
      IconData icon, String label, Color? color, String routePath) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routePath);
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

  Widget _buildProjectItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 20),
        Text(
          'Created 3 days ago',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          'Senior frontend developer (Fintech)',
          style: TextStyle(color: Colors.green),
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
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: 
                  Row(
                    children: [
                      Icon(
                        Icons.remove,
                        size: 10.0,
                        color: Colors.black,
                      ),
                      Text(
                        'Clear expectation about your project or deliverables',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              // Add additional indented text here if needed
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
    );
  }
}
