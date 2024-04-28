import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';
import 'package:student_hub/core/models/output/project_model.dart';

class CompanyDashboardState extends WidgetState {
  final bool hasProject;
  final List<ProjectOutput> projectList;
  final String? username;
  final int clickedProjectID;
  final ProjectOutput? clickedProject;
  final List<ProjectProposalOutput> currentProposals;
  final String? message;

  const CompanyDashboardState({
    this.hasProject = false,
    this.projectList = const [],
    this.username,
    this.clickedProjectID = -1,
    this.clickedProject,
    this.currentProposals = const [],
    this.message,
  });

  @override
  List<Object?> get props => [
        hasProject,
        projectList,
        username,
        clickedProject,
        clickedProjectID,
        currentProposals,
        message,
      ];
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'hasProject': hasProject,
      'projectList': projectList.map((e) => e?.toJson()).toList(),
      'username': username,
    };
  }

  factory CompanyDashboardState.fromJson(Map<String, dynamic> json) {
    return CompanyDashboardState(
      hasProject: json['hasProject'] as bool,
      projectList: (json['projectList'] as List).map((e) => ProjectOutput.fromJson(e)).toList(),
      username: json['username'] as String?,
    );
  }

  CompanyDashboardState copyWith({
    bool? hasProject,
    List<ProjectOutput>? projectList,
    String? username,
    int? clickedProjectID,
    ProjectOutput? clickedProject,
    List<ProjectProposalOutput>? currentProposals,
    String? message,
  }) {
    return CompanyDashboardState(
      hasProject: hasProject ?? this.hasProject,
      projectList: projectList ?? this.projectList,
      username: username ?? this.username,
      clickedProjectID: clickedProjectID ?? this.clickedProjectID,
      clickedProject: clickedProject ?? this.clickedProject,
      currentProposals: currentProposals ?? this.currentProposals,
      message: message ?? this.message,
    );
  }


}