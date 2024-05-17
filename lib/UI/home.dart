import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';




@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              gotoLogin(context);
            },
            icon: const Icon(
              Icons.account_circle,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // AnimatedBackgroundImage(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "home_title1".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'lib/common/ui/assets/icon.png',
                    // Assuming 'assets/icon.png' is the correct path to your icon file
                  ),
                ),
                Text(
                  "home_title2".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Company
                    gotoCompanySignup(context);
                  },
                  child: const Text('Company'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Student
                    gotoStudentSignup(context);
                  },
                  child: const Text('Student'),
                ),
                Text(
                  "home_title3".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
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

// class AnimatedBackgroundImage extends StatefulWidget {
//   @override
//   _AnimatedBackgroundImageState createState() =>
//       _AnimatedBackgroundImageState();
// }

// class _AnimatedBackgroundImageState extends State<AnimatedBackgroundImage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _animation.value,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('lib/common/ui/assets/background.jpeg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
