import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  String _selectedTab = 'Projects'; // Default selected tab

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(
            tabName: 'Projects',
            icon: Badge(child: Icon(Icons.work)),
          ),
          _buildTabItem(
            tabName: 'Dashboard',
            icon: Badge(child: Icon(Icons.dashboard)),
          ),
          _buildTabItem(
            tabName: 'Message',
            icon: Badge(child: Icon(Icons.message)),
          ),
          _buildTabItem(
            tabName: 'Notifications',
            icon: Badge(child: Icon(Icons.notifications)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({required String tabName, required Badge icon}) {
    final isSelected = _selectedTab == tabName;

    return IconButton(
      onPressed: () {
        setState(() {
          _selectedTab = tabName;
        });
        // Navigate to the corresponding screen based on the selected tab
        if (tabName == 'Projects') {
          context.router.push(const StudentSignupRoute());
        } else if (tabName == 'Dashboard') {
          // Navigate to Dashboard screen
        } else if (tabName == 'Message') {
          // Navigate to Message screen
        } else if (tabName == 'Notifications') {
          // Navigate to Notifications screen
        }
      },
      icon: icon
    );
  }
}