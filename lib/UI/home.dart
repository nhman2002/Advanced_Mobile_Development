import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}

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
              Navigator.of(context).pushNamed('/login');
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Build your product with high-skilled student\n\n',
                    style: TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Find and onboard best-skilled students for your product. Students work to gain experience & skills from real-world projects',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '\nStudentHub is university marketplace to connect high-skilled student and company on a real-world project',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}
