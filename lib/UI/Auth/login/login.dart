import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/UI/home.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:dio/dio.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/UI/Auth/login/cubit/login_cubit.dart';
import 'package:student_hub/UI/Auth/login/cubit/login_state.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_cubit.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends BaseWidget<LoginCubit, LoginState>{
  const LoginPage({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const LoginWidget();
  }

  @override
  LoginCubit? provideCubit(BuildContext context) {
    return LoginCubit();
  }
}


class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginWidget> with SnackBarDefault {

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
                handleLogin(context);
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
                    context.router.replace(const SignupPageRoute());
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


  Future<void> handleLogin(BuildContext context) async {
    
    await context.read<LoginCubit>().login(
          email: userController.text,
          password: passwordController.text,
        );
    final isSuccess = context.read<LoginCubit>().state.isLogin;
    final message = context.read<LoginCubit>().state.message ?? '';
    if (isSuccess) {
      showSnackBar(context, 'Login successful');
      context.router.popUntilRoot();
      context.router.replace(const SwitchAccountPageRoute());
    } else {
      showSnackBar(context, message);
    }
  }
}