import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class StudentDashBoard extends StatefulWidget {
  const StudentDashBoard({Key? key}) : super(key: key);

  @override
  State<StudentDashBoard> createState() => _StudentDashBoard();
}

class _StudentDashBoard extends State<StudentDashBoard> {
  bool isContentExpandedActive = false;
  bool isContentExpandedSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentDashBoardCubit, StudentDashBoardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  // Add onPressed logic here
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
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
                  "studentdashboard_student1".tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProjectSectionButton("studentdashboard_student2".tr(), Colors.white, true, (){}),
                    _buildProjectSectionButton("studentdashboard_student3".tr(), Colors.black, false, (){context.router.replace(const StudentWorkingProjectsRoute());}),
                    _buildProjectSectionButton("studentdashboard_student4".tr(), Colors.black, false, (){}),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildProposalSection(
                          isWaiting: false,
                          state: state,
                          title: "studentdashboard_student5".tr() + '${state.activeProposalList.length}',
                          isExpanded: isContentExpandedActive,
                          onPressed: () {
                            setState(() {
                              isContentExpandedActive = !isContentExpandedActive;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        _buildProposalSection(
                          isWaiting: true,
                          state: state,
                          title: "studentdashboard_student6".tr() + '(${state.waitingProposalList.length})',
                          isExpanded: isContentExpandedSubmitted,
                          onPressed: () {
                            setState(() {
                              isContentExpandedSubmitted = !isContentExpandedSubmitted;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCompanyDashboardItem(Icons.work, "studentdashboard_student7".tr(),
                        Colors.white, Colors.blue.shade300),
                    _buildCompanyDashboardItem(Icons.dashboard, "studentdashboard_student8".tr(),
                        Colors.black, Colors.grey.shade300),
                    _buildCompanyDashboardItem(Icons.message, "studentdashboard_student9".tr(),
                        Colors.white, Colors.blue.shade300),
                    _buildCompanyDashboardItem(Icons.notifications, "studentdashboard_student10".tr(),
                        Colors.white, Colors.blue.shade300),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
Widget _buildProposalSection({
  required String title,
  required bool isExpanded,
  required VoidCallback onPressed,
  required StudentDashBoardState state,
  required bool isWaiting,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 30,
              ),
              onPressed: onPressed,
            ),
          ],
        ),
        if (isExpanded) ...[
          if ((isWaiting && state.waitingProposalList.isEmpty) || (!isWaiting && state.activeProposalList.isEmpty))
            Center(
              child: Text("studentdashboard_student11".tr()),
            )
          else
            Container(
              height: MediaQuery.of(context).size.height * 0.3, // Set the height as needed
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: isWaiting ? state.waitingProposalList.length : state.activeProposalList.length,
                itemBuilder: (context, index) {
                  if (isWaiting) {
                    if (state.waitingProposalList.isNotEmpty)
                      return _buildContent(context, state.waitingProposalList[index]);
                  } else {
                    if (state.activeProposalList.isNotEmpty)
                      return _buildContent(context, state.activeProposalList[index]);
                  }
                  return SizedBox(); // Placeholder to satisfy the itemBuilder requirement
                },
              ),
            ),
        ],
      ],
    ),
  );
}

  Widget _buildContent(BuildContext context, ProposalWithProject proposal) {
    DateTime createdAt = DateTime.parse(proposal.createdAt ?? DateTime.now().toString());
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
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            proposal.project.title ?? "studentdashboard_student15".tr(),
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          Text(
            daysValue,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    proposal.project.description ?? "studentdashboard_student16".tr(),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

Widget _buildProjectSectionButton(String label, Color color, bool isBlue, VoidCallback onPressed) {
  return Expanded(
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isBlue ? Colors.blue : Colors.white,
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

  Widget _buildCompanyDashboardItem(
      IconData icon, String label, Color color, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: AnimatedButton(
        icon: icon,
        label: label,
        color: color,
        bgColor: bgColor,
        onPressed: () {
          // Add onPressed logic here
          if (label == "studentdashboard_student7".tr()) {
            context.router.replace(const ProjectListWrapperRoute());
          } else if (label == "studentdashboard_student8".tr()) {
            // context.router.push(const StudentSignupRoute());
          } else if (label == "studentdashboard_student9".tr()) {
            context.router.replace(const MessageListScreenRoute());
          } else if (label == "studentdashboard_student10".tr()) {
            context.router.replace(const StudentSignupRoute());
          }
        },
      ),
    );
  }
}
