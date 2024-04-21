import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';

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
                    context.router.push(const ProjectPostWrapperRoute());
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
          ],
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

  void handleLogout(BuildContext context) {
    _localStorage.clear();
    context.router.replace(const MyAppRoute());
  }
}
