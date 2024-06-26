import 'dart:convert';

import 'package:student_hub/UI/Student/DashBoard/cubit/StudentDashBoard_state.dart';
import 'package:student_hub/UI/Student/ProjectList/cubit/ProjectList_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/repository/favoriteProject.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/repository/proposal.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';

class StudentDashBoardCubit extends WidgetCubit<StudentDashBoardState> {
  StudentDashBoardCubit()
      : super(
          initialState: const StudentDashBoardState(),
          parseJsonFunction: StudentDashBoardState.fromJson,
        );


  final _project = getIt.get<ProjectRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  final _favorite = getIt.get<FavoriteProjectRepository>();
  final _proposal = getIt.get<ProposalRepository>();
  var iniStatus = 0;

  @override
  Future<void> init() async {
    if (iniStatus == 0) {
      await _handleInit();
      iniStatus = 1;
    }
  }
  
  Future<void> _handleInit() async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.parse(studentIDString!);
    final result1 = await _proposal.getStudentProposal(studentID, 1);
    if (result1 is DataSuccess) {
      final activeProposal = result1.data;
      emit(state.copyWith(activeProposalList: activeProposal));
    }
    else {
      emit(state.copyWith(activeProposalList: null));
    }

    final result2 = await _proposal.getStudentProposal(studentID, 0);
    if (result2 is DataSuccess) {
      final waitingProposal = result2.data;
      emit(state.copyWith(waitingProposalList: waitingProposal));
    }
    else {
      emit(state.copyWith(waitingProposalList: null));
    }    

    final result3 = await _proposal.getStudentProposal(studentID, 2);
    if (result3 is DataSuccess) {
      final offer = result3.data;
      emit(state.copyWith(offerList: offer));
    }
    else {
      emit(state.copyWith(offerList: null));
    }
    hideLoading();
  }

  Future<void> getWorkingProposals() async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.parse(studentIDString!);
    final result1 = await _proposal.getStudentProposalWithTypeFlag(studentID, 1);
    if (result1 is DataSuccess) {
      final activeProposal = result1.data;
      emit(state.copyWith(workingProposalList: activeProposal));
    }
    else {
      emit(state.copyWith(workingProposalList: null));
    }
    hideLoading();
  }

  Future<void> acceptOffer(int proposalID) async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.parse(studentIDString!);
    final result = await _proposal.acceptOffer(proposalID);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Offer accepted successfully'));
      final result1 = await _proposal.getStudentProposalWithTypeFlag(studentID, 3);
      if (result1 is DataSuccess) {
        final offer = result1.data;
        emit(state.copyWith(offerList: offer));
      }
      else {
        emit(state.copyWith(message: 'Error'));

      }
    }
    hideLoading();
  }


  
  Future<void> getArchievedProposals() async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.parse(studentIDString!);
    final result1 = await _proposal.getStudentProposalWithTypeFlag(studentID, 2 );
    if (result1 is DataSuccess) {
      final activeProposal = result1.data;
      emit(state.copyWith(archievedProposalList: activeProposal));
    }
    else {
      emit(state.copyWith(archievedProposalList: null));
    }
    hideLoading();
  }
}