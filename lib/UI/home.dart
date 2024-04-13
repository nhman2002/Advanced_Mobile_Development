import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';


void main() {
  runApp(MyApp());
}
@RoutePage()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
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
              gotoLogin(context);
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
                gotoCompanySignup(context);
              },
              child: Text('Company'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút Student
                gotoStudentSignup(context);
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

  void gotoLogin(BuildContext context) {
    context.router.push(const LoginPageRoute());
  }

  void gotoCompanySignup(BuildContext context) {
    context.router.push(const CompanySignupRoute());
  }

  void gotoStudentSignup(BuildContext context) {
    context.router.push(const StudentSignupRoute());
  }
}
