import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';


class CustomBottomAppBar extends StatefulWidget {
  final String _selectedTab;
  const CustomBottomAppBar({super.key, required String selectedTab})
      : _selectedTab = selectedTab;

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  var _selectedTab;
   // Default selected tab
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget._selectedTab;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(
            tabName: 'Projects',
            icon: Icons.work,
            badge: const Badge(child: Icon(Icons.work)),
          ),
          _buildTabItem(
            tabName: 'Dashboard',
            icon: Icons.dashboard,
            badge: const Badge(child: Icon(Icons.dashboard)),
          ),
          _buildTabItem(
            tabName: 'Messages',
            icon: Icons.message,
            badge: const Badge(child: Icon(Icons.message)),
          ),
          _buildTabItem(
            tabName: 'Notifications',
            icon: Icons.notifications,
            badge: const Badge(child: Icon(Icons.notifications)),
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

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
        });
        // Add onPressed logic here
        if (tabName == 'Projects') {
          if (userRole == 0) {
            context.router.replace(const ProjectListWrapperRoute());
          } else {
            context.router.replace(const ProjectListWrapperRoute());
          }
        } else if (tabName == 'Dashboard') {
          if (userRole == 0) {
            context.router.replace(const StudentDashBoardWrapperRoute());
          } else {
            context.router.replace(const CompanyDashboardWrapperRoute());
          }
        } else if (tabName == 'Messages') {
          context.router.replace(const MessageListScreenRoute());
        } else if (tabName == 'Notifications') {
          context.router.replace(const NotificationScreenRoute());
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ?  Theme.of(context).colorScheme.tertiaryContainer : Theme.of(context).colorScheme.onBackground, // Icon color for selected tab
            ),
            Text(
              tabName,
              style: TextStyle(
                color: isSelected ? Theme.of(context).colorScheme.tertiaryContainer : Theme.of(context).colorScheme.onBackground, // Label color for selected tab
              ),
            ),
            // badge, // Display badge if provided
          ],
        ),
      ),
    );
  }
}