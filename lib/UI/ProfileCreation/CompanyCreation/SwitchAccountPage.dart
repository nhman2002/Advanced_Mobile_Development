import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SwitchAccountPage extends StatefulWidget {
  @override
  _SwitchAccountPage createState() => _SwitchAccountPage();
}

class _SwitchAccountPage extends State<SwitchAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              // Routing logic here
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              tilePadding: const EdgeInsets.only(right: 16.0),
              title: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 40.0,
                ),
                title: Text('Hai Pham'),
                subtitle: Text(
                  'Company',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 40.0,
                        ),
                        title: Text('Hai Pham Student'),
                        subtitle: Text(
                          'Student',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            ListTile(
              leading: Icon(Icons.person, color: Colors.black),
              title: Text('Profiles'),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('Settings'),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text('Log out'),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
