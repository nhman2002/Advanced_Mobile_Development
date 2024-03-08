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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Build your product with high-skilled student \n',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\nFind and onboard best-skilled student for your product. Student works to gain experience & skills from real-world projects \n',
                textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
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
            Text(
              '\n\nStudentHub is a university marketplace to connect high-skilled student and company on a real-world project',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),

      
          ], // <-- Đóng square bracket của children
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
