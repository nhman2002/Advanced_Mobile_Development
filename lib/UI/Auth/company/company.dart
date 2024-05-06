import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/UI/Auth/student/student.dart';
import 'package:student_hub/UI/Auth/company/cubit/company_cubit.dart';
import 'package:student_hub/UI/Auth/company/cubit/company_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';

@RoutePage()
class CompanySignup extends BaseWidget<CompanyRegisterCubit, CompanyRegisterState> {
  const CompanySignup({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const CompanyRegisterWidget();
  }

  @override
  CompanyRegisterCubit? provideCubit(BuildContext context) {
    return CompanyRegisterCubit();
  }
}
class CompanyRegisterWidget extends StatefulWidget {
  const CompanyRegisterWidget({super.key});

  @override
  State<CompanyRegisterWidget> createState() => _CompanySignupState();
}

class _CompanySignupState extends State<CompanyRegisterWidget> with SnackBarDefault {
  bool _agreeToTerms = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Company Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Company Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
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
                Text('I agree to the terms and conditions of Student Hub'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  handleSignup(context);
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the student sign-up page
                context.router.push(const StudentSignupRoute());
              },
              child: Text("Looking for projects? Sign up as a student"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleSignup(BuildContext context) async {
    await context.read<CompanyRegisterCubit>().register(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text
    );
    final isSuccess = context.read<CompanyRegisterCubit>().state.isRegister;
    final message = context.read<CompanyRegisterCubit>().state.message ?? '';
    if (isSuccess) {
      showSnackBarSuccess(context, message);
      context.router.popUntilRoot();      
    } else {
      showSnackBarError(context, message);
    }
  }

}