import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class ProjectListState extends WidgetState {
  final int clickedProjectId;
  final ProjectOutput? clickedProject;
  final List<ProjectOutput> projectList;
  final String? username;
  final String? message;

  const ProjectListState({
    this.clickedProject,
    this.clickedProjectId = -1,
    this.projectList = const [],
    this.username,
    this.message,
  });

  @override
  List<Object?> get props => [
        clickedProject,
        clickedProjectId,
        projectList,
        username,
        message,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'clickedProject': clickedProject?.toJson(),
      'clickedProjectId': clickedProjectId,
      'projectList': projectList.map((e) => e?.toJson()).toList(),
      'username': username,
      'message': message ?? '',
    };
  }

  factory ProjectListState.fromJson(Map<String, dynamic> json) {
    return ProjectListState(
      clickedProject: ProjectOutput.fromJson(json['clickedProject']),
      clickedProjectId: json['clickedProjectId'] as int,
      projectList: (json['projectList'] as List).map((e) => ProjectOutput.fromJson(e)).toList(),
      username: json['username'] as String?,
      message: json['message'] as String?,
    );
  }

  ProjectListState copyWith({
    ProjectOutput? clickedProject,
    int? clickedProjectId,
    List<ProjectOutput>? projectList,
    String? username,
    String? message,
  }) {
    return ProjectListState(
      clickedProject: clickedProject ?? this.clickedProject,
      clickedProjectId: clickedProjectId ?? this.clickedProjectId,
      projectList: projectList ?? this.projectList,
      username: username ?? this.username,
      message: message ?? this.message,
    );
  }
  

}