import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_cubit.dart';
import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';

@RoutePage()
class CompanyDashboardWrapper extends BaseWidget<CompanyDashboardCubit, CompanyDashboardState> {
  const CompanyDashboardWrapper({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return const AutoRouter();
  }

  @override
  CompanyDashboardCubit? provideCubit(BuildContext context) {
    return CompanyDashboardCubit()..init();
  }
}