import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';

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
            icon: Icons.work,
            badge: Badge(child: Icon(Icons.work)),
          ),
          _buildTabItem(
            tabName: 'Dashboard',
            icon: Icons.dashboard,
            badge: Badge(child: Icon(Icons.dashboard)),
          ),
          _buildTabItem(
            tabName: 'Message',
            icon: Icons.message,
            badge: Badge(child: Icon(Icons.message)),
          ),
          _buildTabItem(
            tabName: 'Notifications',
            icon: Icons.notifications,
            badge: Badge(child: Icon(Icons.notifications)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(
      {required String tabName, required IconData icon, required Badge badge}) {
    final isSelected = _selectedTab == tabName;

    return (Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: AnimatedButton(
        icon: icon,
        badge: badge,
        label: tabName,
        isSelected: isSelected,
        onPressed: () {
          setState(() {
            _selectedTab = tabName;
          });
          // Add onPressed logic here
          if (tabName == 'Projects') {
            context.router.push(const StudentSignupRoute());
          } else if (tabName == 'Dashboard') {
            context.router.push(const StudentSignupRoute());
          } else if (tabName == 'Message') {
            context.router.push(const MessageListScreenRoute());
          } else if (tabName == 'Notifications') {
            context.router.push(const StudentSignupRoute());
          }
        },
      ),
    ));
  }
}
