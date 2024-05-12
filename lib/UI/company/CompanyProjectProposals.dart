import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';

@RoutePage()
class CompanyProjectProposals extends StatefulWidget {
  const CompanyProjectProposals({super.key});

  @override
  State<CompanyProjectProposals> createState() => _CompanyProjectProposals();
}

class _CompanyProjectProposals extends State<CompanyProjectProposals> with SnackBarDefault {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
      builder: (context, state) {
        final userId = state.userId;
        // Retrieve project detail from state if needed
        final projectDetail = state.clickedProject;
        final proposals = projectDetail?.proposals;
        final proposalList = state.currentProposals;

        return Scaffold(
          appBar: AppBar(
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
                  projectDetail?.title ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProjectSectionButton('Proposals', Colors.white, true),
                    _buildProjectSectionButton('Detail', Colors.black, false),
                    _buildProjectSectionButton('Message', Colors.black, false),
                    _buildProjectSectionButton('Hired', Colors.black, false),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //build content for proposals

                        for (var proposal in proposalList)
                          if (proposal.disableFlag != 1)
                            _buildContent(
                              proposal.id!,
                              proposal.student!.fullname!,
                              proposal.student!.techStackName!,
                              proposal.coverLetter!,
                              proposal.statusFlag!,
                              state.userId!,
                              proposal.student!.userId!,
                              projectDetail!.projectId!,
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(int proposalId, String name, String pos, String des, int statusFlag, int userID, int receiverID, int projectId) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon representing a person
              Icon(
                Icons.person,
                size: 40,
                // You can adjust color and other properties as needed
              ),
              SizedBox(width: 10), // Adjust spacing between icon and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First row with name
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5), // Add some vertical space between rows
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Job title
                  Text(
                    pos,
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10), // Add some vertical space between sections
          Text(
            des,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5), // Add some vertical space between sections
          Row(
            children: [
              // Button for Message
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(MessageDetailScreenRoute(userId: userID, receiverId: receiverID, projectId: projectId, receiverName: name));
                  },
                  child: Text("companyprojectproposals_company1".tr()),
                ),
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              // Button for Hire
              Expanded(
                child: ElevatedButton(
                  onPressed: statusFlag != 2
                      ? () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("companyprojectproposals_company2".tr()),
                                content: Text(
                                    "companyprojectproposals_company3".tr() + '$name?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop();
                                    },
                                    child: Text("companyprojectproposals_company4".tr()),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Perform the hiring action
                                      sendOffer(proposalId);
                                      // You can perform any additional actions here, such as sending a hiring offer
                                      Navigator.of(context)
                                          .pop(); // Close dialog
                                    },
                                    child: Text("companyprojectproposals_company5".tr()),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      : null, // Disable the button if statusFlag is not
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      statusFlag != 2
                          ? Colors.blue
                          : Colors.grey.withOpacity(
                              0.5), // Adjust opacity to make it appear faded
                    ),
                  ),
                  child: Text(
                    statusFlag != 2 ? "companyprojectproposals_company6".tr() : "companyprojectproposals_company7".tr(),
                    style: TextStyle(
                      color: statusFlag != 2
                          ? Colors.white
                          : Colors
                              .black, // Adjust text color based on statusFlag
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Add some vertical space between sections
          Divider(
            color: Colors.grey,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

  Future<void> sendOffer(int proposalId) async {
    await context.read<CompanyDashboardCubit>().sendOffer(proposalId);
    if (!mounted) return;
    final message = context.read<CompanyDashboardCubit>().state.message ?? '';
    showSnackBarSuccess(context, message);   
    //reload the whole page
    context.router.replace(const CompanyProjectProposalsRoute());            
  }




  Widget _buildProjectSectionButton(String label, Color color, bool isBlue) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigate to different screens based on the button clicked
          if (label == 'Detail') {
            context.router.replace(const CompanyProjectDetailRoute());
          } else if (label == 'Message') {
            context.router.replace(const CompanyProjectMessageRoute());
          } else if (label == 'Hired') {
            context.router.replace(const CompanyProjectHiredRoute());
          }
        },
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
}
