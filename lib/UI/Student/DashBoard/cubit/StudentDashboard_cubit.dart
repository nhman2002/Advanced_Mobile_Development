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
    hideLoading();
  }
}