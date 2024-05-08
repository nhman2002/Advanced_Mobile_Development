import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class SignupPage extends StatefulWidget {
    @override
    _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    String _selectedRole = '';
    @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "signup_auth1".tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedRole = 'student';
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: _selectedRole == 'student'
                    ? Colors.blue
                    : Colors.grey.shade300,
                child: Center(
                  child: Text(
                    "signup_auth2".tr(),
                    style: TextStyle(
                      color: _selectedRole == 'student'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedRole = 'company';
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: _selectedRole == 'company'
                    ? Colors.blue
                    : Colors.grey.shade300,
                child: Center(
                  child: Text(
                    'I am a company, find engineers for projects',
                    style: TextStyle(
                      color: _selectedRole == 'company'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedRole == 'student') {
                  context.router.replace(const StudentSignupRoute());
                } else if (_selectedRole == 'company') {
                  context.router.replace(const CompanySignupRoute());
                }
                else {
                  // Show an error message
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("signup_auth3".tr()),
                        content: Text("signup_auth4".tr()),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
                // Add your create account logic here
              },
              child: Text("signup_auth5".tr()),
            ),
          ],
        ),
      ),
    );
  }
}