import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/config/dependency.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  String _selectedTab = 'Projects'; // Default selected tab
  final _localStorage = getIt.get<LocalStorage>();
  String? userRole;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    final userRoleString = _localStorage.getString(key: StorageKey.currentRole);
    final userRole = int.parse(userRoleString!);
    return (Container(
      decoration: BoxDecoration(
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
            if (userRole == 0) {
              context.router.replace(const StudentProjectListRoute());
            } else {
              context.router.replace(const StudentProjectListRoute());
            }
          } else if (tabName == 'Dashboard') {
            if (userRole == 0) {
              context.router.replace(const StudentDashBoardWrapperRoute());
            } else {
              context.router.replace(const CompanyDashboardRoute());
            }
          } else if (tabName == 'Message') {
            context.router.replace(const MessageListScreenRoute());
          } else if (tabName == 'Notifications') {
            context.router.replace(const NotificationScreenRoute());
          }
        },
      ),
    ));
  }
}
