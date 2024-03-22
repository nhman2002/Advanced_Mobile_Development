import 'package:flutter/material.dart';

void main() {
  runApp(Dashboard_ProjectPosts());
}
class Dashboard_ProjectPosts extends StatelessWidget {
  const Dashboard_ProjectPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your jobs'),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle button press
                    },
                    icon: Icon(Icons.post_add, size: 20),
                    label: Text('Post a job'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              filterTabs(), // Call filterTabs method here
              SizedBox(height: 40),
              Column(
                children: [
                  Text('Welcome, Hai!'),
                  Text('You have no jobs!'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterTabs() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 100, 100, 100),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DefaultTabController(
            length: 3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return TabBar(
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Color(0xFF00658a),
                      width: 3.0,
                    ),
                  ),
                  labelColor: const Color(0xFF00658a),
                  unselectedLabelColor: Color.fromARGB(255, 86, 86, 86),
                  // onTap: (index) {
                  //   // Handle tab selection
                  // },
                  tabs: [
                    Tab(text: 'All projects'),
                    Tab(text: 'Working'),
                    Tab(text: 'Archived'),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}