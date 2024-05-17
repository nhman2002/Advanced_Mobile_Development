import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_cubit.dart';
import 'package:student_hub/UI/profileCreation/StudentCreation/cubit/studentProfileInput_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class StudentProfileInputWrapper extends BaseWidget<StudentProfileInputCubit, StudentProfileInputState> {
  const StudentProfileInputWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  StudentProfileInputCubit? provideCubit(BuildContext context) {
    return StudentProfileInputCubit()..init();
  }
}