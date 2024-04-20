class ProjectOutput {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? companyId;
  int? ProjectOutputScopeFlag;
  String? title;
  String? description;
  int? numberOfStudents;
  int? typeFlag;
  List<dynamic>? proposals;
  int? countProposal;
  int? countMessages;
  int? countHired;

  ProjectOutput({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.companyId,
    this.ProjectOutputScopeFlag,
    this.title,
    this.description,
    this.numberOfStudents,
    this.typeFlag,
    this.proposals,
    this.countProposal,
    this.countMessages,
    this.countHired,
  });

  Map<String, dynamic> toMapProjectOutput() {
    return {
      'companyId': companyId,
      'ProjectOutputScopeFlag': ProjectOutputScopeFlag,
      'title': title,
      'description': description,
      'typeFlag': typeFlag,
      'numberOfStudents': numberOfStudents,
    };
  }

  factory ProjectOutput.fromMapProjectOutput(Map<String, dynamic> map) {
    return ProjectOutput(
      id: map['id'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
      companyId: map['companyId'],
      ProjectOutputScopeFlag: map['ProjectOutputScopeFlag'],
      title: map['title'],
      description: map['description'],
      numberOfStudents: map['numberOfStudents'],
      typeFlag: map['typeFlag'],
      proposals: map['proposals'],
      countProposal: map['countProposals'],
      countMessages: map['countMessages'],
      countHired: map['countHired'],
    );
  }
  
  ProjectOutput copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? companyId,
    int? ProjectOutputScopeFlag,
    String? title,
    String? description,
    int? numberOfStudents,
    int? typeFlag,
    List<dynamic>? proposals,
    int? countProposal,
    int? countMessages,
    int? countHired,
  }) =>
    ProjectOutput(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      companyId: companyId ?? this.companyId,
      ProjectOutputScopeFlag: ProjectOutputScopeFlag ?? this.ProjectOutputScopeFlag,
      title: title ?? this.title,
      description: description ?? this.description,
      numberOfStudents: numberOfStudents ?? this.numberOfStudents,
      typeFlag: typeFlag ?? this.typeFlag,
      proposals: proposals ?? this.proposals,
      countProposal: countProposal ?? this.countProposal,
      countMessages: countMessages ?? this.countMessages,
      countHired: countHired ?? this.countHired,
    );

  @override
  factory ProjectOutput.fromJson(Map<String, dynamic> json) {
    return ProjectOutput(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      companyId: json['companyId'] as String?,
      ProjectOutputScopeFlag: json['ProjectOutputScopeFlag'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      numberOfStudents: json['numberOfStudents'] as int?,
      typeFlag: json['typeFlag'] as int?,
      proposals: json['proposals'] as List<dynamic>?,
      countProposal: json['countProposals'] as int?,
      countMessages: json['countMessages'] as int?,
      countHired: json['countHired'] as int?,
    );}

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'companyId': companyId,
      'ProjectOutputScopeFlag': ProjectOutputScopeFlag,
      'title': title,
      'description': description,
      'numberOfStudents': numberOfStudents,
      'typeFlag': typeFlag,
      'proposals': proposals,
      'countProposals': countProposal,
      'countMessages': countMessages,
      'countHired': countHired,
    };
  }
  
  
  }


class ProjectOutputList{
  List<ProjectOutput> projectOutputList;

  ProjectOutputList({required this.projectOutputList});

  factory ProjectOutputList.fromJson(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return ProjectOutputList(projectOutputList: []);
    } else
      return ProjectOutputList(
        projectOutputList: (json['result'] as List).map((e) => ProjectOutput.fromJson(e)).toList(),
    );
  }

  //to a list of projects
  List<ProjectOutput> toListProjectOutput() {
    return projectOutputList;
  }

  
}