import 'dart:convert';

import 'package:student_hub/UI/company/cubit/CompanyDashboard_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/project_post_model.dart';
import 'package:student_hub/core/models/input/proposal_model.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/message.dart';
import 'package:student_hub/core/repository/profileStudent.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/repository/proposal.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/auth/login/cubit/login_state.dart';

class CompanyDashboardCubit extends WidgetCubit<CompanyDashboardState> {
  CompanyDashboardCubit()
      : super(
          initialState: const CompanyDashboardState(),
          parseJsonFunction: CompanyDashboardState.fromJson,
        );

  final _project = getIt.get<ProjectRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  final _student = getIt.get<StudentProfileRepository>();
  final _proposal = getIt.get<ProposalRepository>();
  final _message = getIt.get<MessageRepository>();

  @override
  Future<void> init() async {
    showLoading();
    String? userId = _localStorage.getString(key: StorageKey.userID);
    emit(state.copyWith(userId: int.parse(userId!)));

    String? id = _localStorage.getString(key: StorageKey.companyID);
    final result = await _project.getCompanyProjects(int.parse(id!));
    if (result is DataSuccess) {
      final project = result.data?.projectOutputList;
      emit(state.copyWith(projectList: project));
    } else {
      emit(state.copyWith(projectList: null));
    }
    hideLoading();
  }

  Future<void> projectClicked(int index) async {
    showLoading();
    emit(state.copyWith(clickedProjectID: index));
    final result1 = await _project.getProject(index);
    if (result1 is DataSuccess) {
      emit(state.copyWith(clickedProject: result1.data));
    } else {
      emit(state.copyWith(clickedProject: null));
    }
    final result = await _proposal.getProposalByProjectId(index);
    if (result is DataSuccess) {
      emit(state.copyWith(currentProposals: result.data));
    } else {
      emit(state.copyWith(clickedProject: null));
    }
    final result2 = await _message.getMessageByProject(index);
    if (result2 is DataSuccess) {
      emit(state.copyWith(messagesOfProject: result2.data));
    } else {
      emit(state.copyWith(messagesOfProject: null));
    }
    hideLoading();
  }

  void setClickedProject(int id) {
    emit(state.copyWith(clickedProjectID: id));
  }

  Future<void> workingOnProject(ProjectOutput form) async {
    emit(state.copyWith(clickedProjectID: form.projectId));
    final apiform = ProjectPostForm().copyWith(
        companyId: form.companyId,
        title: form.title,
        description: form.description,
        projectScopeFlag: form.projectScopeFlag,
        numberOfStudents: form.numberOfStudents,
        typeFlag: 1);
    final result = await _project.updateProject(form.projectId!, apiform);

    if (result is DataSuccess) {
      init();
      emit(state.copyWith(message: 'Project updated successfully'));
    } else {
      emit(state.copyWith(clickedProject: null));
    }
  }

  Future<void> archiveProject(ProjectOutput form) async {
    emit(state.copyWith(clickedProjectID: form.projectId));
    final apiform = ProjectPostForm().copyWith(
        companyId: form.companyId,
        title: form.title,
        description: form.description,
        projectScopeFlag: form.projectScopeFlag,
        numberOfStudents: form.numberOfStudents,
        typeFlag: 2);
    final result = await _project.updateProject(form.projectId!, apiform);

    if (result is DataSuccess) {
      init();
      emit(state.copyWith(message: 'Project updated successfully'));
    } else {
      emit(state.copyWith(clickedProject: null));
    }
  }

  Future<void> editProject(ProjectPostForm project, int projectId) async {
    showLoading();
    final result = await _project.updateProject(projectId, project);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Project updated successfully'));
    } else {
      emit(state.copyWith(message: 'Error'));
    }
    init();
    hideLoading();
  }

  Future<void> sendOffer(int proposalId) async {
    final apiform = ProposalPatchForm().copyWith(statusFlag: 2);
    final result = await _proposal.sendOffer(proposalId);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Offer sent successfully'));
    } else {
      emit(state.copyWith(message: 'Error'));
    }
    final result1 = await _proposal.getProposalByProjectId(proposalId);
    if (result1 is DataSuccess) {
      emit(state.copyWith(currentProposals: result1.data));
    } else {
      emit(state.copyWith(clickedProject: null));
    }
  }

  Future<void> deleteProject(int projectId) async {
    showLoading();
    final result = await _project.deleteProject(projectId);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Project deleted successfully'));
    } else {
      emit(state.copyWith(message: 'Error'));
    }
    String? id = _localStorage.getString(key: StorageKey.companyID);
    final result1 = await _project.getCompanyProjects(int.parse(id!));
    if (result1 is DataSuccess) {
      emit(state.copyWith(projectList: result1.data?.projectOutputList));
    } else {
      emit(state.copyWith(projectList: null));
    }
    hideLoading();
  }

  Future<void> updateProject(ProjectOutput project) async {
    showLoading();
    final apiform = ProjectPostForm().copyWith(
        companyId: project.companyId,
        title: project.title,
        description: project.description,
        projectScopeFlag: project.projectScopeFlag,
        numberOfStudents: project.numberOfStudents,
        typeFlag: project.typeFlag);
    final result = await _project.updateProject(project.projectId!, apiform);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Project updated successfully'));
    } else {
      emit(state.copyWith(message: 'Error'));
    }
    String? id = _localStorage.getString(key: StorageKey.companyID);
    final result1 = await _project.getCompanyProjects(int.parse(id!));
    if (result1 is DataSuccess) {
      emit(state.copyWith(projectList: result1.data?.projectOutputList));
    } else {
      emit(state.copyWith(projectList: null));
    }
    hideLoading();
  }
}
