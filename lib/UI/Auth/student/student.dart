import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/auth/company/company.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/UI/auth/student/cubit/student_cubit.dart';
import 'package:student_hub/UI/auth/student/cubit/student_state.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:easy_localization/easy_localization.dart';




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
              "student_auth1".tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "student_auth5".tr(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "student_auth6".tr(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "student_auth7".tr(),
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
                Text( "student_auth2".tr()),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your sign-up logic for students here
                handleSignup(context);
              },
              child: Text("student_auth3".tr()),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the company sign-up page
                context.router.push(const CompanySignupRoute());
              },
              child: Text("student_auth4".tr()),
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
    showSnackBarSuccess(context, message);
    await Future.delayed(const Duration(seconds: 2));
    context.router.popUntilRoot();
  } else {
    showSnackBarError(context, message);
  }
  }

}


