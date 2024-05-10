import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/UI/auth/student/student.dart';
import 'package:student_hub/UI/auth/company/cubit/company_cubit.dart';
import 'package:student_hub/UI/auth/company/cubit/company_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';

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
              "company_auth1".tr(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "company_auth2".tr(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "company_auth3".tr(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "company_auth4".tr(),
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
                Text("company_auth5".tr()),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  handleSignup(context);
              },
              child: Text("company_auth6".tr()),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the student sign-up page
                context.router.push(const StudentSignupRoute());
              },
              child: Text("company_auth7".tr()),
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