import 'dart:convert';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/company_model.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Project/ProjectPost/cubit/ProjectPost_state.dart';

class ProjectPostCubit extends WidgetCubit<ProjectPostState> {
  ProjectPostCubit()
      : super(
          initialState: const ProjectPostState(),
          parseJsonFunction: ProjectPostState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();
  final _projectRepository = getIt.get<ProjectRepository>();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Future<void> init() async {


  }

  Future<void> handleProjectPost(int? projectScopeFlag, String? title, int? numberOfStudents, String? description) async {
    showLoading();
    final companyID = _localStorage.getString(key: StorageKey.companyID);
    final form = ProjectPostForm().copyWith(companyId: companyID, projectScopeFlag: projectScopeFlag, title: title, numberOfStudents: numberOfStudents, description: description, typeFlag: 0);
    final result = await _projectRepository.projectPost(form);
    if (result is DataSuccess) {
      final project = result.data;
      final projectString = jsonEncode(project);
      emit(state.copyWith(postSuccess: true));
    } else {
      emit(state.copyWith(postSuccess: false));
    }
    hideLoading();

   }
  void updateTitle(String newTitle) {
    // Create a copy of the current state with the updated title
    emit(state.copyWith(title: newTitle));
  }

  void updateDescription(String newDescription) {
    // Create a copy of the current state with the updated description
    emit(state.copyWith(description: newDescription));
  }

  void updateNumberOfStudents(int newNumberOfStudents) {
    // Create a copy of the current state with the updated number of students
    emit(state.copyWith(numberOfStudents: newNumberOfStudents));
  }

  void updateProjectScopeFlag(int newProjectScopeFlag) {
    // Create a copy of the current state with the updated project scope flag
    emit(state.copyWith(projectScopeFlag: newProjectScopeFlag));
  }

  void updateTypeFlag(int newTypeFlag) {
    // Create a copy of the current state with the updated type flag
    emit(state.copyWith(typeFlag: newTypeFlag));
  }
  
}

