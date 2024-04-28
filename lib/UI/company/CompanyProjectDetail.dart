import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/common/config/router.dart';

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
                  project?.title ?? '',
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
                    _buildProjectSectionButton('Proposals', Colors.black, false),
                    _buildProjectSectionButton('Detail', Colors.white, true),
                    _buildProjectSectionButton('Message', Colors.black, false),
                    _buildProjectSectionButton('Hired', Colors.black, false),
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
                          SizedBox(height: 25),
                          Text(
                            project?.description ?? 'No Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                          ),
                          SizedBox(height: 25),
                          Divider(),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                size: 40.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Project scope:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            size: 10.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              project?.projectScopeFlag == 0 ? 'Less than 1 month' : 'More than 1 month',
                                              style: TextStyle(color: Colors.black),
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
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Icon(
                                Icons.people,
                                size: 40.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Student required:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            size: 10.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                              width:
                                                  5), // Adjust spacing between icon and text
                                          Expanded(
                                            child: Text(
                                              '${project?.numberOfStudents} students',
                                              style: TextStyle(color: Colors.black),
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



Widget _buildProjectSectionButton(String label, Color color, bool isBlue) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        // Navigate to different screens based on the button clicked
        if (label == 'Proposals') {
          context.router.replace(const CompanyProjectProposalsRoute());
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
