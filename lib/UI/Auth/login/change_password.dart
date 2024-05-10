import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  final String email;
  const ChangePasswordView(this.email, {required Key key}) : super(key: key);

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final ValueNotifier<String> oldPasswordNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> newPasswordNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> confirmPasswordNotifier =
      ValueNotifier<String>('');
  bool _obscurePassword = true;
  bool _showPassError = false;

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
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
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
                "Create new password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF406AFF),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your new password must be different from previous used password.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Password",
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
                  hintText: 'Enter your old password',
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
                "New Password",
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
                  errorText: _showPassError ? 'Both passwords must match' : null,
                  hintText: 'Enter your new password',
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
                "Confirm Password",
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
                  errorText: _showPassError ? 'Both passwords must match' : null,
                  hintText: 'Confirm your new password',
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
                  }
                      : null,
                  color: Color(0xFF406AFF),
                  disabledColor: Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Reset password",
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

void main() {
  runApp(MaterialApp(
    home: ChangePasswordView('example@email.com', key: UniqueKey()), // Thêm key vào đây
  ));
}

