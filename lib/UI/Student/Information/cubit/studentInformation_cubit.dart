import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/general.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/core/repository/proposal.dart';


class StudentInformationCubit extends WidgetCubit<StudentInformationState> {
  StudentInformationCubit()
      : super(
          initialState: const StudentInformationState(),
          parseJsonFunction: StudentInformationState.fromJson,
        );

  final _localStorage = getIt.get<LocalStorage>();
  final _proposal = getIt.get<ProposalRepository>();
  final _general = getIt.get<GeneralRepository>();
  var iniStatus = 0;
  @override
  Future<void> init() async{
    // TODO: implement init
    if( iniStatus == 0){
      await _handleInit();
      iniStatus = 1;
    }
  }
  
  Future<void> _handleInit() async {
    showLoading();
    final studentIDString = _localStorage.getString(key: StorageKey.studentID);
    final studentID = int.parse(studentIDString!);
    final result1 = await _general.getExperience(studentID);
    final result2 = await _general.getEducation(studentID);
    final result3 = await _general.getLanguage(studentID);
    // missing techStack, transcript, resume API

    // final result1 = await _proposal.getStudentProposal(studentID, 1);

    
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
