import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

class HomeScreen extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút Company
                print('Company button pressed');
              },
              child: Text('Company'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút Student
                print('Student button pressed');
              },
              child: Text('Student'),
            ),
          ],
        ),
      ),
    );
  }
}

