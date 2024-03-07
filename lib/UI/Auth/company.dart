import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';
import 'package:student_hub/UI/Auth/student.dart';

// Company signup page
class CompanySignup extends StatefulWidget {
  @override
  _CompanySignupState createState() => _CompanySignupState();
}

class _CompanySignupState extends State<CompanySignup> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign Up as Company',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Company Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Company Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                Text('I agree to the terms and conditions of students'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your sign-up logic for companies here
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the student sign-up page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => StudentSignup()),
                );
              },
              child: Text("Looking for projects? Sign up as a student"),
            ),
          ],
        ),
      ),
    );
  }
}