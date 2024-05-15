import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_cubit.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
// import 'package:student_hub/core/config/dependency.dart';
// import 'package:student_hub/core/models/data_state.dart';
// import 'package:student_hub/core/models/output/student_profile.dart';
// import 'package:student_hub/core/repository/profileStudent.dart';

@RoutePage()
class StudentInformationScreen extends BaseWidget<StudentInformationCubit, StudentInformationState> {
  // final StudentProfile student;
  const StudentInformationScreen({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const StudentInformationWidget();
  }

  @override
  StudentInformationCubit? provideCubit(BuildContext context) {
    return StudentInformationCubit();
  }
  
  
}

class StudentInformationWidget extends StatefulWidget{
  const StudentInformationWidget({super.key});

  @override
  State<StudentInformationWidget> createState() => _StudentInformationScreen();
}

class _StudentInformationScreen extends State<StudentInformationWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<StudentInformationCubit, StudentInformationState>(
      builder: (context, state) {
        print(state);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Student Detail",
              style: theme.textTheme.headlineMedium!.copyWith(),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 70,
                      clipBehavior: Clip.none,
                      width: 70,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey
                              .withOpacity(0.2), // Adjusted color usage
                          width: 2,
                        ),
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'lib/common/ui/assets/circle_avatar.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        // widget.student.fullname ?? '', // Replace with actual data
                        // style: theme.textTheme.bodyMedium,
                        // ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Tech Stack', // Replace with actual data
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: Colors.blue, // Change color if needed
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'Project Title', // Replace with actual data
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: const Color.fromARGB(255, 231, 144, 5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Cover Letter', // Replace with actual data
                  style: theme.textTheme.bodyText1,
                ),
                SizedBox(height: 20),
                Text(
                  "TechStack",
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Education",
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  child: Text(
                    'No data', // Replace with actual data
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resume",
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F7F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              'lib/common/ui/assets/pdf.png',
                              scale: 1.8,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Resume.pdf', // Replace with actual data
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transcript",
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F7F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              'lib/common/ui/assets/pdf.png',
                              scale: 1.8,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transcript.pdf', // Replace with actual data
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                SizedBox(height: 4),
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
        );
      },
    );
  }
}
