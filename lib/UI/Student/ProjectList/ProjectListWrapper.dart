import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_cubit.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class ProjectListWrapper extends BaseWidget<ProjectListCubit, ProjectListState> {
  const ProjectListWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  ProjectListCubit? provideCubit(BuildContext context) {
    return ProjectListCubit()..init();
  }
}