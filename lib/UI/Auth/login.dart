import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_hub/routes.dart';
import 'package:dio/dio.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/auth.dart';
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
  //final _localStorage = getIt.get<LocalStorage>();


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
    String url = 'http://192.168.1.8:4400/api/auth/sign-in';

    // Prepare the data to be sent in the request body
    String data = jsonEncode({
      'email': username,
      'password': password,
    });
    print(data);
    try{
      await dio.post(url, data: data).then((response) {
        // Handle the response
      // Check if the request was successful
      if (response.statusCode == 201) {
        String token = response.data['result']['token'];
        Navigator.pushNamed(context, Routes.dashBoard);
      } else {
        // Handle the error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data['ErrorDetails']),
          backgroundColor: Colors.red,
        ));
      }
    });
    } on DioException catch (e) {
  // The request was made and the server responded with a status code
  // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      // Extract error details from the response body
      Map<String, dynamic> errorResponse = e.response?.data;
      String requestId = errorResponse['requestId'];
      List<String> errorDetails = List<String>.from(errorResponse['errorDetails']);
      // Snackbar to display the error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$errorDetails'),
        backgroundColor: const Color.fromARGB(255, 160, 144, 143),
      ));
    } else {
      // Handle error based on your application logic
      print('Error message: ${e.message}');
    }
}
  }
}