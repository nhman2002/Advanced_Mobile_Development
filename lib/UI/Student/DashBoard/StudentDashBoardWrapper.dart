import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashboard_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class StudentDashBoardWrapper extends BaseWidget<StudentDashBoardCubit, StudentDashBoardState> {
  const StudentDashBoardWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  StudentDashBoardCubit? provideCubit(BuildContext context) {
    return StudentDashBoardCubit()..init();
  }
}