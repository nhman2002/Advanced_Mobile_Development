import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';
import 'package:dio/dio.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/config/dependency.dart';

//login page
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final passwordController = TextEditingController();
  final userController = TextEditingController();
  final _localStorage = getIt.get<LocalStorage>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Student Hub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Login with StudentHub',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your sign-in logic here
                handleLogin(context, userController.text, passwordController.text);
                Navigator.pushNamed(context, Routes.companyProfileInput);
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signup);
                    // Add your sign-up navigation logic here
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


Future<void> handleLogin(BuildContext context, String username, String password) async {
    Dio dio = Dio();
    // Define the endpoint URL
    String url = 'localhost:4400/api/auth/sign-in';

    // Prepare the data to be sent in the request body
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    Response response = await dio.post(url, data: data);

    // Check if the request was successful
    if (response.statusCode == 200) {
      String token = response.data['token'];
      _localStorage
        ..saveString(key: StorageKey.accessToken, value: token ?? '');
      // Navigate to the next screen (company profile input in this case)
      Navigator.pushNamed(context, Routes.companyProfileInput);
    } else {
      // If request was not successful, show an error popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text(response.data['message']),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    }

}
