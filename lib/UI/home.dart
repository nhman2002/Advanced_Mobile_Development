import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';

void main() {
  runApp(MyApp());
}

@RoutePage()
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              gotoLogin(context);
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'Build your product with high-skilled student\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'lib/common/ui/Assets/icon.png',
                    // Assuming 'assets/icon.png' is the correct path to your icon file
                  ),
                ),
                Text(
                  '\nFind and onboard best-skilled student for your product. Student works to gain experience & skills from real-world projects \n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Company
                    gotoCompanySignup(context);
                  },
                  child: Text('Company'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Student
                    gotoStudentSignup(context);
                  },
                  child: Text('Student'),
                ),
                Text(
                  '\n\nStudentHub is a university marketplace to connect high-skilled student and company on a real-world project',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void gotoLogin(BuildContext context) {
    context.router.push(const LoginPageRoute());
  }

  void gotoCompanySignup(BuildContext context) {
    context.router.push(const CompanySignupRoute());
  }

  void gotoStudentSignup(BuildContext context) {
    context.router.push(const StudentSignupRoute());
  }
}

class AnimatedBackgroundImage extends StatefulWidget {
  @override
  _AnimatedBackgroundImageState createState() =>
      _AnimatedBackgroundImageState();
}

class _AnimatedBackgroundImageState extends State<AnimatedBackgroundImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/common/ui/Assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
