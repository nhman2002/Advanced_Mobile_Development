import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class StudentDashBoardState extends WidgetState {
  final List<Proposal> proposalList;
  final List<ProjectOutput> projectList;
  final List<ProposalWithProject> waitingProposalList;
  final List<ProposalWithProject> activeProposalList;
  final List<ProposalWithProject> workingProposalList;
  final List<ProposalWithProject> archievedProposalList;
  final List<ProposalWithProject> offerList;
  final String? username;
  final String? message;

  const StudentDashBoardState({
    this.proposalList = const [],
    this.projectList = const [],
    this.waitingProposalList = const [],
    this.activeProposalList = const [],
    this.workingProposalList = const [],
    this.archievedProposalList = const [],
    this.offerList = const [],
    this.username,
    this.message,
  });

  @override
  List<Object?> get props => [
        proposalList,
        projectList,
        waitingProposalList,
        activeProposalList,
        workingProposalList,
        archievedProposalList,
        offerList,
        username,
        message,

      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'projectList': projectList.map((e) => e.toJson()).toList(),
      'username': username,
      'message': message ?? '',
    };
  }

  factory StudentDashBoardState.fromJson(Map<String, dynamic> json) {
    return StudentDashBoardState(

      proposalList: Proposal.fromJsonList(json['clickedProject']),
      projectList: (json['projectList'] as List).map((e) => ProjectOutput.fromJson(e)).toList(),
      waitingProposalList: (json['waitingProposalList'] as List).map((e) => ProposalWithProject.fromJson(e)).toList(),
      activeProposalList: (json['activeProposalList'] as List).map((e) => ProposalWithProject.fromJson(e)).toList(),
      workingProposalList: (json['workingProposalList'] as List).map((e) => ProposalWithProject.fromJson(e)).toList(),
      archievedProposalList: (json['archievedProposalList'] as List).map((e) => ProposalWithProject.fromJson(e)).toList(),
      username: json['username'] as String?,
      message: json['message'] as String?,
    );
  }

  StudentDashBoardState copyWith({
    ProjectOutput? clickedProject,
    List<ProjectOutput>? projectList,
    List<Proposal>? proposalList,
    List<ProposalWithProject>? waitingProposalList,
    List<ProposalWithProject>? activeProposalList,
    List<ProposalWithProject>? workingProposalList,
    List<ProposalWithProject>? archievedProposalList,
    List<ProposalWithProject>? offerList,
    String? username,
    String? message,
  }) {
    return StudentDashBoardState(
      proposalList: proposalList ?? this.proposalList,
      projectList: projectList ?? this.projectList,
      waitingProposalList: waitingProposalList ?? this.waitingProposalList,
      activeProposalList: activeProposalList ?? this.activeProposalList,
      workingProposalList: workingProposalList ?? this.workingProposalList,
      archievedProposalList: archievedProposalList ?? this.archievedProposalList,
      offerList: offerList ?? this.offerList,
      username: username ?? this.username,
      message: message ?? this.message,
    );
  }
  

}