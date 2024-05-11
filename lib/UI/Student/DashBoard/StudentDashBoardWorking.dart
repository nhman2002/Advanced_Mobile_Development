import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';

@RoutePage()
class StudentWorkingProjects extends StatefulWidget {
  const StudentWorkingProjects({super.key});

  @override
  State<StudentWorkingProjects> createState() => _StudentWorkingProjects();
}

class _StudentWorkingProjects extends State<StudentWorkingProjects> {
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
                          false),
                      _buildProjectSectionButton(
                          "studentdashboard_student3".tr(), Colors.white, true),
                      _buildProjectSectionButton(
                          "studentdashboard_student4".tr(),
                          Colors.black,
                          false),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "studentdashboardworking_student2".tr(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        _buildContent(),
                        _buildContent(),
                        _buildContent(),
                        _buildContent(),
                        _buildContent(),
                        _buildContent(),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const CustomBottomAppBar(),
          );
        
      },
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "studentdashboardworking_student3".tr(),
            style: TextStyle(color: Colors.green),
          ),
          Text(
            "studentdashboardworking_student4".tr(),
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\u2022 ',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "studentdashboardworking_student5".tr(),
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

  Widget _buildProjectSectionButton(String label, Color color, bool isBlue) {
    return Expanded(
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
    );
  }
}
