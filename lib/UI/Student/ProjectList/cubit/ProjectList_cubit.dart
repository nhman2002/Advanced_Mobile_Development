import 'dart:convert';

import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/models/input/proposal_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/favoriteProject.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/repository/proposal.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Auth/login/cubit/login_state.dart';

class ProjectListCubit extends WidgetCubit<ProjectListState> {
  ProjectListCubit()
      : super(
          initialState: const ProjectListState(),
          parseJsonFunction: ProjectListState.fromJson,
        );


  final _project = getIt.get<ProjectRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  final _favorite = getIt.get<FavoriteProjectRepository>();
  final _proposal = getIt.get<ProposalRepository>();


  @override
  Future<void> init() async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.tryParse(studentIDString ?? '');

    await initFavoriteProject();

    final result = await _project.getAllProjects();
    // if (result is DataSuccess) {
    final project = result.data?.projectOutputList;
      // emit(state.copyWith(projectList: project));
    // }
    // else {
    //   emit(state.copyWith(projectList: null));
    // }
    
    final result1 = await _proposal.getAllStudentProposals(studentID ?? 0);
    if (result1 is DataSuccess) {
      //remove all project have projectid in proposal from project list
      final proposal = result1.data;
      final projectList = project;
      final proposalProjectIds = proposal!.map((p) => p.projectId).toList();
      final filteredProjectList = projectList!.where((project) => !proposalProjectIds.contains(project.projectId)).toList();
      emit(state.copyWith(projectList: filteredProjectList));
      }
    hideLoading();
    }

  Future<void> projectClicked(int index) async {
    emit(state.copyWith(clickedProjectId: index));
  }

  Future<void> getProject(int id) async {
    final result = await _project.getProject(id);
    if (result is DataSuccess) {
      final project = result.data;
      emit(state.copyWith(clickedProject: project));
    }
    else {
      emit(state.copyWith(clickedProject: null));
      final error = result.error?.response?.data['errorDetails'];
      emit(state.copyWith(message: error));
    }
  }

  Future<void> addFavoriteProject(int id) async {
    final studentID = _localStorage.getString(key: StorageKey.studentID);
    final form = FavoriteProjectForm().copyWith(projectId: id, disableFlag: 0);
  
    final result = await _favorite.favoriteProject(int.parse(studentID!), form);
    if (result is DataSuccess) {
      final project = result.data;
      emit(state.copyWith(message: 'Project added to favorites'));
    }
    else {
      emit(state.copyWith(clickedProject: null));
      final error = result.error?.response?.data['errorDetails'];
      final errorMessage = error is List ? error.join(", ") : error as String?;
      emit(state.copyWith(message: errorMessage));
    }
  }

  bool isProjectFavorite(int id)  {
    //check if project is in favorite list
    final favorite = state.favoriteProjectList;
    if (favorite != null) {
      final isFavorite = favorite.any((element) => element.projectId == id);
      return isFavorite;
    }
    return false;

    
  }

  Future<void> removeFavoriteProject(int id) async {
    final studentID = _localStorage.getString(key: StorageKey.studentID);
    final form = FavoriteProjectForm().copyWith(projectId: id, disableFlag: 1);
  
    final result = await _favorite.favoriteProject(int.parse(studentID!), form);
    if (result is DataSuccess) {
      final project = result.data;
      emit(state.copyWith(message: 'Project removed from favorites'));
    }
    else {
      emit(state.copyWith(clickedProject: null));
      final error = result.error?.response?.data['errorDetails'];
      final errorMessage = error is List ? error.join(", ") : error as String?;
      emit(state.copyWith(message: errorMessage));    
    }
  }

  Future<void> initFavoriteProject() async{
    final studentID = _localStorage.getString(key: StorageKey.studentID);
    final result = await _favorite.getFavoriteProjects(int.parse(studentID!));
    if (result is DataSuccess) {
      final favoriteProjects = result.data?.projectOutputList;
      emit(state.copyWith(favoriteProjectList: favoriteProjects));
    }
    else {
      emit(state.copyWith(favoriteProjectList: null));
    }
  }

  Future<void> clearProject() async {
    emit(state.copyWith(clickedProject: null));
    emit(state.copyWith(clickedProjectId: -1));
  }

  Future<void> postProposal(int projectId, String coverLetter) async {
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.tryParse(studentIDString ?? '');
    final form = ProposalPostForm().copyWith(projectId: projectId, studentId: studentID, coverLetter: coverLetter);

    final result = await _proposal.proposalPost(form);
    if (result is DataSuccess) {
      final proposal = result.data;
      emit(state.copyWith(clickedProject: null, message: 'Proposal sent'));
    }
    else {
      emit(state.copyWith(clickedProject: null));
      final error = result.error?.response?.data['errorDetails'];
      final errorMessage = error is List ? error.join(", ") : error as String?;
      emit(state.copyWith(message: errorMessage));
    }
  }

  
}