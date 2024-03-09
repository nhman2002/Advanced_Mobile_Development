import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your jobs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add onPressed logic here
                    Navigator.pushNamed(context, Routes.companyProfileEdit);
                  },
                  child: Text('Post a job'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Welcome Hai',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's get start with your first project post",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            Container(
              color: Colors.blue, // Background color of the row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDashboardItem(Icons.work, 'Projects', Colors.white),
                  _buildDashboardItem(
                      Icons.dashboard, 'Dashboard', Colors.black),
                  _buildDashboardItem(Icons.message, 'Message', Colors.white),
                  _buildDashboardItem(
                      Icons.notifications, 'Alerts', Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(IconData icon, String label, Color? color) {
    return Container(
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
    );
  }
}
