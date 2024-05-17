import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:easy_localization/easy_localization.dart';

@RoutePage()
class StudentDashBoard extends StatefulWidget {
  const StudentDashBoard({super.key});

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
            title: const Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.replace(const SwitchAccountPageRoute());
                },
                icon: const Icon(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "studentdashboard_student1".tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        width:
                            8), // Add some space between the Text and the button
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(const OfferListPageRoute());
                      },
                      child: const Text("View Offer"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProjectSectionButton("studentdashboard_student2".tr(),
                        Colors.white, true, () {}),
                    _buildProjectSectionButton(
                        "studentdashboard_student3".tr(), Colors.black, false,
                        () {
                      context
                          .read<StudentDashBoardCubit>()
                          .getWorkingProposals();

                      context.router
                          .replace(const StudentWorkingProjectsRoute());
                    }),
                    _buildProjectSectionButton(
                        "studentdashboard_student4".tr(), Colors.black, false,
                        () {
                      context
                          .read<StudentDashBoardCubit>()
                          .getWorkingProposals();

                      context.router
                          .replace(const StudentArchievedProjectRoute());
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildProposalSection(
                          isWaiting: false,
                          state: state,
                          title: '${"studentdashboard_student5".tr()}${state.activeProposalList.length}',
                          isExpanded: isContentExpandedActive,
                          onPressed: () {
                            setState(() {
                              isContentExpandedActive =
                                  !isContentExpandedActive;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _buildProposalSection(
                          isWaiting: true,
                          state: state,
                          title: '${"studentdashboard_student6".tr()}(${state.waitingProposalList.length})',
                          isExpanded: isContentExpandedSubmitted,
                          onPressed: () {
                            setState(() {
                              isContentExpandedSubmitted =
                                  !isContentExpandedSubmitted;
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
          bottomNavigationBar: const CustomBottomAppBar(selectedTab: 'Dashboard'),
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
        border: Border.all(),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
            if ((isWaiting && state.waitingProposalList.isEmpty) ||
                (!isWaiting && state.activeProposalList.isEmpty))
              Center(
                child: Text("studentdashboard_student11".tr()),
              )
            else
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.3, // Set the height as needed
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isWaiting
                      ? state.waitingProposalList.length
                      : state.activeProposalList.length,
                  itemBuilder: (context, index) {
                    if (isWaiting) {
                      if (state.waitingProposalList.isNotEmpty) {
                        return _buildContent(
                            context, state.waitingProposalList[index]);
                      }
                    } else {
                      if (state.activeProposalList.isNotEmpty) {
                        return _buildContent(
                            context, state.activeProposalList[index]);
                      }
                    }
                    return const SizedBox(); // Placeholder to satisfy the itemBuilder requirement
                  },
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ProposalWithProject proposal) {
    DateTime createdAt =
        DateTime.parse(proposal.createdAt ?? DateTime.now().toString());
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);
    int daysAgo = difference.inDays;
    String daysValue = '';
    if (daysAgo == 0) {
      daysValue = "studentdashboard_student12".tr();
    } else if (daysAgo == 1)
      daysValue = "studentdashboard_student13".tr();
    else
      daysValue = '$daysAgo${"studentdashboard_student14".tr()}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            proposal.project.title ?? "studentdashboard_student15".tr(),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          Text(
            daysValue,
            style: const TextStyle(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    proposal.project.description ??
                        "studentdashboard_student16".tr(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
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
          padding: const EdgeInsets.all(10),
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
