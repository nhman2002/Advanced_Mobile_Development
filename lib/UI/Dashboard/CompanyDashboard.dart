import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';


@RoutePage()
class CompanyDashboard extends StatefulWidget {
  @override
  _CompanyDashboard createState() => _CompanyDashboard();
}

  final _localStorage = getIt.get<LocalStorage>();


class _CompanyDashboard extends State<CompanyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              handleLogout(context);
            },
            icon: Icon(
              Icons.logout,
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
                    print('Post a job');
                    context.router.push(const ProjectPosting1Route());
                  },
                  child: Text('Post a job'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Welcome ' + _localStorage.getString(key: StorageKey.userName)!,
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
            OverflowBar(children: [
              _buildCompanyDashboardItem(
                  Icons.work, 'Projects', Colors.white),
              _buildCompanyDashboardItem(
                  Icons.dashboard, 'Dashboard', Colors.black),
              _buildCompanyDashboardItem(
                  Icons.message, 'Message', Colors.white),
              _buildCompanyDashboardItem(
                  Icons.notifications, 'Alerts', Colors.white),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyDashboardItem(IconData icon, String label, Color? color) {
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

  void handleLogout(BuildContext context) {
    _localStorage.clear();
    context.router.replace(const MyAppRoute());
  }
}