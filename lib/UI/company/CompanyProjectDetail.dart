import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/UI/company/widget/ProposalSectionButton.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:easy_localization/easy_localization.dart';


@RoutePage()
class CompanyProjectDetail extends StatefulWidget {
  const CompanyProjectDetail({super.key});

  @override
  State<CompanyProjectDetail> createState() => _CompanyProjectDetail();
}

class _CompanyProjectDetail extends State<CompanyProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyDashboardCubit, CompanyDashboardState>(
      builder: (context, state) {
        // Retrieve project detail from state if needed
        final project = state.clickedProject; 


        return Scaffold(
          appBar: AppBar(
            title: const Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  // Add onPressed logic here
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
                Text(
                  project?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildProposalSectionButton(Theme.of(context),"companyprojecthired_company1".tr(), Colors.black, false, (){context.router.replace(const CompanyProjectProposalsRoute());}),
                    buildProposalSectionButton(Theme.of(context),"companyprojecthired_company2".tr(), Colors.white, true, (){}),
                    buildProposalSectionButton(Theme.of(context),"companyprojecthired_company3".tr(), Colors.black, false, (){context.router.replace(const CompanyProjectMessageRoute());}),
                    buildProposalSectionButton(Theme.of(context),"companyprojecthired_company4".tr(), Colors.black, false, (){context.router.replace(const CompanyProjectHiredRoute());}),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 600,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Text(
                            project?.description ?? "companyprojectdetail_company1".tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Divider(),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Icon(
                                Icons.alarm,
                                size: 40.0,
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "companyprojectdetail_company2".tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.remove,
                                            size: 10.0,
                                          ),
                                          const SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              project?.projectScopeFlag == 0 ? "companyprojectdetail_company3".tr() : "companyprojectdetail_company3".tr(),
                                              style: const TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              const Icon(
                                Icons.people,
                                size: 40.0,
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "companyprojectdetail_company5".tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.remove,
                                            size: 10.0,
                                          ),
                                          const SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              '${project?.numberOfStudents}${"companyprojectdetail_company6".tr()}',
                                              style: const TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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


}
