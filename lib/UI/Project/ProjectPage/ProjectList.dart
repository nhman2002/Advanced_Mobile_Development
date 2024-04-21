import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:auto_route/auto_route.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectList createState() => _ProjectList();
}

class _ProjectList extends State<ProjectList> {
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
                       Navigator.pushNamed(context, context.router.push(const LoginPageRoute()) as String);
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
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

              // Align(
              //   alignment: Alignment.center,
              //   child: OverflowBar(
              //     children: [
              //       _buildDashboardItem(Icons.work, 'Projects', Colors.black,
              //       ),
              //       _buildDashboardItem(Icons.dashboard, 'Dashboard',
              //           Colors.white),
              //       _buildDashboardItem(
              //           Icons.message, 'Message', Colors.white),
              //       _buildDashboardItem(Icons.notifications, 'Alerts',
              //           Colors.white),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                _buildCompanyDashboardItem(
                    Icons.work, 'Projects', Colors.white, Colors.blue.shade300),
                _buildCompanyDashboardItem(Icons.dashboard, 'Dashboard',
                    Colors.black, Colors.grey.shade300),
                _buildCompanyDashboardItem(Icons.message, 'Message',
                    Colors.white, Colors.blue.shade300),
                _buildCompanyDashboardItem(Icons.notifications, 'Alerts',
                    Colors.white, Colors.blue.shade300),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyDashboardItem(
      IconData icon, String label, Color color, Color bgColor) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: AnimatedButton(
          icon: icon,
          label: label,
          color: color,
          bgColor: bgColor,
          onPressed: () {
            // Add onPressed logic here
            // print('$label pressed');
          },
        ));
  }

  Widget _buildProjectItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Created 3 days ago',
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
                          // Navigator.pushNamed(context, context.router.push(const DashBoardRoute()) as String);
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
      ],
    );
  }
}
