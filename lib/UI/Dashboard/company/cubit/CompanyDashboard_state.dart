import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';
import 'package:student_hub/core/models/output/project_model.dart';

class CompanyDashboardState extends WidgetState {
  final bool hasProject;
  final List<ProjectOutput> projectList;
  final String? username;

  const CompanyDashboardState({
    this.hasProject = false,
    this.projectList = const [],
    this.username,
  });

  @override
  List<Object?> get props => [
        hasProject,
        projectList,
        username,
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
  }) {
    return CompanyDashboardState(
      hasProject: hasProject ?? this.hasProject,
      projectList: projectList ?? this.projectList,
      username: username ?? this.username,
    );
  }


}