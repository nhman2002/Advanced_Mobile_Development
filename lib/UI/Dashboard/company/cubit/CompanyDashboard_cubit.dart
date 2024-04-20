import 'dart:convert';

import 'package:student_hub/UI/Dashboard/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Auth/login/cubit/login_state.dart';

class CompanyDashboardCubit extends WidgetCubit<CompanyDashboardState> {
  CompanyDashboardCubit()
      : super(
          initialState: const CompanyDashboardState(),
          parseJsonFunction: CompanyDashboardState.fromJson,
        );

  final _project = getIt.get<ProjectRepository>();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Future<void> init() async {
    String? id = _localStorage.getString(key: StorageKey.companyID);
    final result = await _project.getCompanyProjects(int.parse(id!));
    if (result  is DataSuccess) {
      final project = result.data?.projectOutputList;
      emit(state.copyWith(projectList: project));
    }
    else {
      emit(state.copyWith(projectList: null));
    }
  }
}