import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Auth/company/company.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/UI/Auth/student/cubit/student_cubit.dart';
import 'package:student_hub/UI/Auth/student/cubit/student_state.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/models/output/student_profile.dart';



@RoutePage()
class StudentSignup extends BaseWidget<StudentRegisterCubit, StudentRegisterState> {
  const StudentSignup({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const StudentRegisterWidget();
  }

  @override
  StudentRegisterCubit? provideCubit(BuildContext context) {
    return StudentRegisterCubit();
  }
}
class StudentRegisterWidget extends StatefulWidget {
  const StudentRegisterWidget({super.key});

  @override
  State<StudentRegisterWidget> createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentRegisterWidget> with SnackBarDefault {
  bool _agreeToTerms = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Student Hub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sign Up as Student',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email/Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              //TODO: Add a confirm password field
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
                // Add your sign-up logic for students here
                handleSignup(context);
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the company sign-up page
                context.router.push(const CompanySignupRoute());
              },
              child: Text("Looking for engineers? Sign up as a company"),
            ),
          ],
        ),
      ),
    );
  }

Future<void> handleSignup(BuildContext context) async {
  await context.read<StudentRegisterCubit>().register(
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text
  );
  final isSuccess = context.read<StudentRegisterCubit>().state.isRegister;
  final message = context.read<StudentRegisterCubit>().state.message ?? '';
  if (isSuccess) {
    showSnackBar(context, message);
    await Future.delayed(const Duration(seconds: 2));
    context.router.maybePop();
    context.router.maybePop();

  } else {
    showSnackBar(context, message);
  }
  }

}


