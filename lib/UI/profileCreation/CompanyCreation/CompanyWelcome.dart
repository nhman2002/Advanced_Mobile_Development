import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class CompanyWelcomeRoute extends StatefulWidget {
  const CompanyWelcomeRoute({super.key});

  @override
  _CompanyWelcomeRouteState createState() => _CompanyWelcomeRouteState();
}

class _CompanyWelcomeRouteState extends State<CompanyWelcomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const LoginPageRoute());
            },
            icon: const Icon(
              Icons.account_circle,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions,
              size: 100.0,
            ),
            const SizedBox(height: 20),
            Text(
              "companywelcome_ProfileCreation1".tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "companywelcome_ProfileCreation2".tr(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add onPressed logic here
                context.router.push(const CompanyDashboardWrapperRoute());
              },
              child: Text("companywelcome_ProfileCreation3".tr()),
            ),
          ],
        ),
      ),
    );
  }
}
