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
                    buildProposalSectionButton(Theme.of(context),'Proposals', Colors.black, false, (){context.router.replace(const CompanyProjectProposalsRoute());}),
                    buildProposalSectionButton(Theme.of(context),'Detail', Colors.black, false, (){context.router.replace(const CompanyProjectDetailRoute());}),
                    buildProposalSectionButton(Theme.of(context),'Message', Colors.black, false, (){context.router.replace(const CompanyProjectMessageRoute());}),
                    buildProposalSectionButton(Theme.of(context),'Hired', Colors.white, true, (){}),
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
                        //build content for proposals

                        
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

}
