//to do: we need to check state of the project post form, from 1 to 4 to ensure
//that the user has filled all the required fields before moving to the next page


import 'package:student_hub/core/widget_cubit/widget_state.dart';

class ProjectPostState extends WidgetState {
  final bool? has1;
  final bool? has2;
  final bool? has3;
  final bool postSuccess;
  final String? companyId;
  final int? projectScopeFlag;
  final String? title;
  final int? numberOfStudents;
  final String? description;
  final int? typeFlag;
  final String? message;
  const ProjectPostState({
    this.has1,
    this.has2,
    this.has3,
    this.postSuccess = false,
    this.companyId,
    this.projectScopeFlag,
    this.title,
    this.numberOfStudents,
    this.description,
    this.typeFlag,
    this.message


  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    has1,
    has2,
    has3,
    postSuccess,
    companyId,
    projectScopeFlag,
    title,
    numberOfStudents,
    description,
    typeFlag,
    message
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory ProjectPostState.fromJson(Map<String, dynamic> json) {
    return ProjectPostState(
      has1: json['has1'] as bool?,
      has2: json['has2'] as bool?,
      has3: json['has3'] as bool?,
      postSuccess: json['postSuccess'] as bool,
      companyId: json['companyId'] as String?,
      projectScopeFlag: json['projectScopeFlag'] as int?,
      title: json['title'] as String?,
      numberOfStudents: json['numberOfStudents'] as int?,
      description: json['description'] as String?,
      typeFlag: json['typeFlag'] as int?,
      message: json['message'] as String?

    );
  }

  ProjectPostState copyWith({
    bool? has1,
    bool? has2,
    bool? has3,
    bool? postSuccess,
    String? companyId,
    String? title,
    int? projectScopeFlag,
    int? numberOfStudents,
    String? description,
    int? typeFlag,
    String? message


  }) {
    return ProjectPostState(
      has1: has1 ?? this.has1,
      has2: has2 ?? this.has2,
      has3: has3 ?? this.has3,
      postSuccess: postSuccess ?? this.postSuccess,
      companyId: companyId ?? this.companyId,
      projectScopeFlag: projectScopeFlag ?? this.projectScopeFlag,
      title: title ?? this.title,
      numberOfStudents: numberOfStudents ?? this.numberOfStudents,
      description: description ?? this.description,
      typeFlag: typeFlag ?? this.typeFlag,
      message: message ?? this.message

    );
  }
}