class ProjectOutput {
  int? projectId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? companyId;
  int? projectScopeFlag;
  String? title;
  String? description;
  int? numberOfStudents;
  int? typeFlag;
  List<dynamic>? proposals;
  int? countProposal;
  int? countMessages;
  int? countHired;

  ProjectOutput({
    this.projectId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.companyId,
    this.projectScopeFlag,
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
      'projectScopeFlag': projectScopeFlag,
      'title': title,
      'description': description,
      'typeFlag': typeFlag,
      'numberOfStudents': numberOfStudents,
    };
  }

  factory ProjectOutput.fromMapProjectOutput(Map<String, dynamic> map) {
    return ProjectOutput(
      projectId: map['projectId'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      deletedAt: map['deletedAt'],
      companyId: map['companyId'],
      projectScopeFlag: map['projectScopeFlag'],
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
    int? projectId,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? companyId,
    int? projectScopeFlag,
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
      projectId: projectId ?? this.projectId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      companyId: companyId ?? this.companyId,
      projectScopeFlag: projectScopeFlag ?? this.projectScopeFlag,
      title: title ?? this.title,
      description: description ?? this.description,
      numberOfStudents: numberOfStudents ?? this.numberOfStudents,
      typeFlag: typeFlag ?? this.typeFlag,
      proposals: proposals ?? this.proposals,
      countProposal: countProposal ?? this.countProposal,
      countMessages: countMessages ?? this.countMessages,
      countHired: countHired ?? this.countHired,
    );
  // "data": {
  //   "result": {
  //     "id": 1,
  //     "createdAt": "2024-04-20T09:26:29.403Z",
  //     "updatedAt": "2024-04-20T09:26:29.403Z",
  //     "deletedAt": null,
  //     "companyId": "2",
  //     "projectScopeFlag": 2,
  //     "title": "wiw",
  //     "description": "thaty  la vui qua di\n",
  //     "numberOfStudents": 12,
  //     "typeFlag": 0,
  //     "proposals": [],
  //     "countProposals": 0,
  //     "countMessages": 0,
  //     "countHired": 0
  //   }
  // }
  @override
  factory ProjectOutput.fromJson2(Map<String, dynamic> json) {
    return ProjectOutput(
      projectId: json['result']['id'] as int?,
      createdAt: json['result']['createdAt'] as String?,
      updatedAt: json['result']['updatedAt'] as String?,
      deletedAt: json['result']['deletedAt'] as String?,
      companyId: json['result']['companyId'] as String,
      projectScopeFlag: json['result']['projectScopeFlag'] as int?,
      title: json['result']['title'] as String?,
      description: json['result']['description'] as String?,
      numberOfStudents: json['result']['numberOfStudents'] as int?,
      typeFlag: json['result']['typeFlag'] as int?,
      proposals: json['result']['proposals'] as List<dynamic>?,
      countProposal: json['result']['countProposals'] as int?,
      countMessages: json['result']['countMessages'] as int?,
      countHired: json['result']['countHired'] as int?,
    );
  }

  @override
  factory ProjectOutput.fromJson(Map<String, dynamic> json) {
    return ProjectOutput(
      projectId: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      companyId: json['companyId'] as String?,
      projectScopeFlag: json['projectScopeFlag'] as int?,
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
      'projectId': projectId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'companyId': companyId,
      'projectScopeFlag': projectScopeFlag,
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



