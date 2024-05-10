import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/repository/user.dart';


@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordScreen> {
  final ValueNotifier<String> oldPasswordNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> newPasswordNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> confirmPasswordNotifier =
      ValueNotifier<String>('');
  bool _obscurePassword = true;
  bool _showPassError = false;

  final _user = getIt.get<UserRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Hub',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "changepassword_auth1".tr(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF406AFF),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "changepassword_auth2".tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "changepassword_auth3".tr(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                onChanged: (value) => oldPasswordNotifier.value = value,
                obscureText: _obscurePassword,
                cursorColor: Color(0xFF406AFF),
                decoration: InputDecoration(
                  hintText: "changepassword_auth4".tr(),
                  hintStyle: TextStyle(
                    color: Color(0xFF777B8A),
                    fontSize: 14.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 0.8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "changepassword_auth5".tr(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                onChanged: (value) {
                  newPasswordNotifier.value = value;
                  setState(() {
                    _showPassError = false;
                  });
                },
                obscureText: _obscurePassword,
                cursorColor: Color(0xFF406AFF),
                decoration: InputDecoration(
                  errorText: _showPassError ? "changepassword_auth6".tr() : null,
                  hintText: "changepassword_auth7".tr(),
                  hintStyle: TextStyle(
                    color: Color(0xFF777B8A),
                    fontSize: 14.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 0.8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "changepassword_auth8".tr(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                onChanged: (value) {
                  confirmPasswordNotifier.value = value;
                  setState(() {
                    _showPassError = false;
                  });
                },
                obscureText: _obscurePassword,
                cursorColor: Color(0xFF406AFF),
                decoration: InputDecoration(
                  errorText: _showPassError ? "changepassword_auth6".tr() : null,
                  hintText: "changepassword_auth9".tr(),
                  hintStyle: TextStyle(
                    color: Color(0xFF777B8A),
                    fontSize: 14.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 0.8),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4BEC0C7), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 50,
                child: MaterialButton(
                  onPressed: oldPasswordNotifier.value.isNotEmpty &&
                      newPasswordNotifier.value.isNotEmpty &&
                      confirmPasswordNotifier.value.isNotEmpty
                      ? () async {
                    if (newPasswordNotifier.value !=
                        confirmPasswordNotifier.value) {
                      setState(() {
                        _showPassError = true;
                      });
                      return;
                    }
                    // Call your change password method here
                    await _user.changePassword(
                       oldPasswordNotifier.value,
                       newPasswordNotifier.value,
                    );
                  }
                      : null,
                  color: Color(0xFF406AFF),
                  disabledColor: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "changepassword_auth10".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

