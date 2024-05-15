import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/UI/company/widget/ProposalSectionButton.dart';
import 'package:student_hub/common/config/router.dart';

@RoutePage()
class CompanyProjectHired extends StatefulWidget {
  const CompanyProjectHired({super.key});

  @override
  State<CompanyProjectHired> createState() => _CompanyProjectHired();
}

class _CompanyProjectHired extends State<CompanyProjectHired> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
      builder: (context, state) {
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
                  projectDetail!.title!,
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
                    buildProposalSectionButton(
                        Theme.of(context), 'Proposals', Colors.black, false,
                        () {
                      context.router
                          .replace(const CompanyProjectProposalsRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context), 'Detail', Colors.black, false, () {
                      context.router.replace(const CompanyProjectDetailRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context), 'Message', Colors.black, false, () {
                      context.router
                          .replace(const CompanyProjectMessageRoute());
                    }),
                    buildProposalSectionButton(
                        Theme.of(context), 'Hired', Colors.white, true, () {}),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 600,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

  Widget _buildContent(int proposalId, String name, String pos, String des,
      int statusFlag, int userID, int receiverID, int projectId) {
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
                    context.router.push(MessageDetailScreenRoute(
                        userId: userID,
                        receiverId: receiverID,
                        projectId: projectId,
                        receiverName: name));
                  },
                  child: Text("companyprojectproposals_company1".tr()),
                ),
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const StudentInformationScreenRoute());
                  },
                  child: Text("Information"),
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
}
