import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class CompanyWelcomeRoute extends StatefulWidget {
  @override
  _CompanyWelcomeRouteState createState() => _CompanyWelcomeRouteState();
}

class _CompanyWelcomeRouteState extends State<CompanyWelcomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Hub'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const LoginPageRoute());
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
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
            Icon(
              Icons.directions,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              "companywelcome_ProfileCreation1".tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "companywelcome_ProfileCreation2".tr(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
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
