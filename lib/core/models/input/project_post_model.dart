class ProjectPostForm {
  String? companyId;
  int? projectScopeFlag;
  String? title;
  String? description;
  int? numberOfStudents;
  int? typeFlag;


  ProjectPostForm({

    this.companyId,
    this.projectScopeFlag,
    this.title,
    this.description,
    this.numberOfStudents,
    this.typeFlag,

  });

  Map<String, dynamic> toJson() {
    return {
      'companyId': companyId,
      'projectScopeFlag': projectScopeFlag,
      'title': title,
      'description': description,
      'numberOfStudents': numberOfStudents,
      'typeFlag': typeFlag,
    };
  }

  factory ProjectPostForm.fromJson(Map<String, dynamic> json) {
    return ProjectPostForm(
      companyId: json['companyId'] as String?,
      projectScopeFlag: json['projectScopeFlag'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      numberOfStudents: json['numberOfStudents'] as int?,
      typeFlag: json['typeFlag'] as int?,
    );
  }

  Map<String, dynamic> toMapProjectPostForm() {
    return {
      'companyId': companyId,
      'projectScopeFlag': projectScopeFlag,
      'title': title,
      'description': description,
      'typeFlag': typeFlag,
      'numberOfStudents': numberOfStudents,
    };
  }

  factory ProjectPostForm.fromMapProjectPostForm(Map<String, dynamic> map) {
    return ProjectPostForm(

      companyId: map['companyId'],
      projectScopeFlag: map['projectScopeFlag'],
      title: map['title'],
      description: map['description'],
      numberOfStudents: map['numberOfStudents'],
      typeFlag: map['typeFlag'],

    );
  }   
  
  ProjectPostForm copyWith({
    String? companyId,
    int? projectScopeFlag,
    String? title,
    String? description,
    int? numberOfStudents,
    int? typeFlag,
  }) =>
      ProjectPostForm(
        companyId: companyId ?? this.companyId,
        projectScopeFlag: projectScopeFlag ?? this.projectScopeFlag,
        title: title ?? this.title,
        description: description ?? this.description,
        numberOfStudents: numberOfStudents ?? this.numberOfStudents,
        typeFlag: typeFlag ?? this.typeFlag,
      );
  
  
  }