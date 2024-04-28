import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';

@RoutePage()
class CompanyProjectMessage extends StatefulWidget {
  const CompanyProjectMessage({super.key});

  @override
  State<CompanyProjectMessage> createState() => _CompanyProjectMessage();
}

class _CompanyProjectMessage extends State<CompanyProjectMessage> {
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
                    _buildProjectSectionButton('Proposals', Colors.white, true),
                    _buildProjectSectionButton('Detail', Colors.black, false),
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



Widget _buildProjectSectionButton(String label, Color color, bool isBlue) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        // Navigate to different screens based on the button clicked
        if (label == 'Detail') {
          // Navigate to project detail screen
          // Replace 'ProjectDetailScreen' with the appropriate screen/widget
          
        } else if (label == 'Message') {
          // Navigate to message screen
          // Replace 'MessageScreen' with the appropriate screen/widget
        } else if (label == 'Hired') {
          // Navigate to hired screen
          // Replace 'HiredScreen' with the appropriate screen/widget
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
