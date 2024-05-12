import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/models/output/student_profile.dart';

@RoutePage()
class StudentArchievedProject extends StatefulWidget {
  const StudentArchievedProject({super.key});

  @override
  State<StudentArchievedProject> createState() => _StudentArchievedProject();
}

class _StudentArchievedProject extends State<StudentArchievedProject> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentDashBoardCubit, StudentDashBoardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.replace(const SwitchAccountPageRoute());
                },
                icon: Icon(
                  Icons.account_circle,
                  size: 40.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "studentdashboardworking_student1".tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProjectSectionButton(
                      "studentdashboard_student2".tr(),
                      Colors.black,
                      false,
                      () {
                        context.router.replace(const StudentDashBoardRoute());
                      },
                    ),
                    _buildProjectSectionButton(
                      "studentdashboard_student3".tr(),
                      Colors.black,
                      false,
                      () {
                        context
                            .read<StudentDashBoardCubit>()
                            .getWorkingProposals();
                        context.router.replace(const StudentWorkingProjectsRoute());
                      },
                    ),
                    _buildProjectSectionButton(
                      "studentdashboard_student4".tr(),
                      Colors.white,
                      true,
                      () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.workingProposalList.map((proposal) {
                        return _buildProposalBox(proposal);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomAppBar(),
        );
      },
    );
  }

  Widget _buildProposalBox(ProposalWithProject proposal) {
    DateTime createdAt =
        DateTime.parse(proposal.createdAt ?? DateTime.now().toString());
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    int daysAgo = difference.inDays;
    String daysValue = '';
    if (daysAgo == 0)
      daysValue = "studentdashboard_student12".tr();
    else if (daysAgo == 1)
      daysValue = "studentdashboard_student13".tr();
    else
      daysValue = '$daysAgo' + "studentdashboard_student14".tr();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            proposal.project.title ?? "Title",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            proposal.project.description ?? "Description",
            style: TextStyle(color: Colors.green),
          ),
          SizedBox(height: 5),
          Text(
            daysValue,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _getPostedAgo(DateTime? createdAt) {
    if (createdAt == null) return "";
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    int daysAgo = difference.inDays;
    if (daysAgo < 1) {
      int hoursAgo = difference.inHours;
      if (hoursAgo < 1) {
        int minutesAgo = difference.inMinutes;
        return "$minutesAgo minute${minutesAgo != 1 ? "s" : ""}";
      }
      return "$hoursAgo hour${hoursAgo != 1 ? "s" : ""}";
    }
    return "$daysAgo day${daysAgo != 1 ? "s" : ""}";
  }

  Widget _buildProjectSectionButton(
      String label, Color color, bool isBlue, VoidCallback onPressed) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: isBlue ? Colors.purple : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            label,
            style: TextStyle(color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
