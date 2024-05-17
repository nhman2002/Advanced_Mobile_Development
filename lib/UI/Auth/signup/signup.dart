import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

    @override
    _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    String _selectedRole = '';
    @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Hub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "signup_auth1".tr(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedRole = 'student';
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "signup_auth2".tr(),
                    style: const TextStyle(
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedRole = 'company';
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "signup_auth6".tr(),
                    style: const TextStyle(
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                            child: const Text('OK'),
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