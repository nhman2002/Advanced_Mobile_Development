import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

class LetGetStartedsScreen extends StatefulWidget {
  @override
  _LetGetStartedsScreenState createState() => _LetGetStartedsScreenState();
}

class _LetGetStartedsScreenState extends State<LetGetStartedsScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.directions,
              size: 100.0,
              color: Colors.blue,
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
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add onPressed logic here
                Navigator.pushNamed(context, Routes.dashBoard);
              },
              child: Text('Get Started!'),
            ),
          ],
        ),
      ),
    );
  }
}
