import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class ProjectPostWrapper extends BaseWidget<ProjectPostCubit, ProjectPostState> {
  const ProjectPostWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  ProjectPostCubit? provideCubit(BuildContext context) {
    return ProjectPostCubit()..init();
  }
}