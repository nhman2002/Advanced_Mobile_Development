class StudentProfile {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int userId;
  int techStackId;
  String? resume;
  String? transcript;
  List<Proposal> proposals;
  List<Education> educations;
  List<Language> languages;
  List<Experience> experiences;
  List<SkillSet> skillSets;

  StudentProfile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.techStackId,
    required this.resume,
    required this.transcript,
    required this.proposals,
    required this.educations,
    required this.languages,
    required this.experiences,
    required this.skillSets,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'userId': this.userId,
      'techStackId': this.techStackId,
      'resume': this.resume,
      'transcript': this.transcript,
      'proposals': this.proposals,
      'educations': this.educations,
      'languages': this.languages,
      'experiences': this.experiences,
      'skillSets': this.skillSets,
    };
  }

  factory StudentProfile.fromMap(Map<String, dynamic> map) {
    return StudentProfile(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      userId: map['userId'] as int,
      techStackId: map['techStackId'] as int,
      resume: map['resume'] as String,
      transcript: map['transcript'] as String,
      proposals: map['proposals'] as List<Proposal>,
      educations: map['educations'] as List<Education>,
      languages: map['languages'] as List<Language>,
      experiences: map['experiences'] as List<Experience>,
      skillSets: map['skillSets'] as List<SkillSet>,
    );
  }
factory StudentProfile.fromJson(Map<String, dynamic> json) {
  return StudentProfile(
    id: json['result']['id'] as int? ?? 0,
    createdAt: json['result']['createdAt'] as String,
    updatedAt: json['result']['updatedAt'] as String,
    deletedAt: json['result']['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
    userId: json['result']['userId'] as int,
    techStackId: json['result']['techStackId'] as int,
    resume: json['result']['resume'] == null ? null : json['result']['resume'] as String,
    transcript: json['result']['transcript'] == null ? null : json['result']['transcript'] as String,
    proposals: (json['result']['proposals'] as List<dynamic>?)?.map((e) => Proposal.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    educations: (json['result']['educations'] as List<dynamic>?)?.map((e) => Education.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    languages: (json['result']['languages'] as List<dynamic>?)?.map((e) => Language.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    experiences: (json['result']['experiences'] as List<dynamic>?)?.map((e) => Experience.fromJson(e as Map<String, dynamic>)).toList() ?? [],
    skillSets: (json['result']['skillSets'] as List<dynamic>?)?.map((e) => SkillSet.fromJson(e as Map<String, dynamic>)).toList() ?? [],
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'userId': userId,
      'techStackId': techStackId,
      'resume': resume,
      'transcript': transcript,
      'proposals': proposals,
      'educations': educations,
      'languages': languages,
      'experiences': experiences,
      'skillSets': skillSets,
    };
  }




  StudentProfile copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? userId,
    int? techStackId,
    String? resume,
    String? transcript,
    TechStackList? techStack,
    List<Proposal>? proposals,
    List<Education>? educations,
    List<Language>? languages,
    List<Experience>? experiences,
    List<SkillSet>? skillSets,
  }) {
    return StudentProfile(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      userId: userId ?? this.userId,
      techStackId: techStackId ?? this.techStackId,
      resume: resume ?? this.resume,
      transcript: transcript ?? this.transcript,
      proposals: proposals ?? this.proposals,
      educations: educations ?? this.educations,
      languages: languages ?? this.languages,
      experiences: experiences ?? this.experiences,
      skillSets: skillSets ?? this.skillSets,
    );
  }

  


}

class Education {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int studentId;
  String schoolName;
  String startYear;
  String endYear;

  Education({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentId,
    required this.schoolName,
    required this.startYear,
    required this.endYear,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'studentId': this.studentId,
      'schoolName': this.schoolName,
      'startYear': this.startYear,
      'endYear': this.endYear,
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      studentId: map['studentId'] as int,
      schoolName: map['schoolName'] as String,
      startYear: map['startYear'] as String,
      endYear: map['endYear'] as String,
    );
  }

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['result']['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      studentId: json['studentId'] as int,
      schoolName: json['schoolName'] as String,
      startYear: json['startYear'] as String,
      endYear: json['endYear'] as String,
    );
  }
  
}

class Experience {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int studentId;
  String title;
  String startMonth;
  String endMonth;
  String description;
  List<TechStack> skillSets;

  Experience({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentId,
    required this.title,
    required this.startMonth,
    required this.endMonth,
    required this.description,
    required this.skillSets,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'studentId': this.studentId,
      'title': this.title,
      'startMonth': this.startMonth,
      'endMonth': this.endMonth,
      'description': this.description,
      'skillSets': this.skillSets,
    };
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      studentId: map['studentId'] as int,
      title: map['title'] as String,
      startMonth: map['startMonth'] as String,
      endMonth: map['endMonth'] as String,
      description: map['description'] as String,
      skillSets: map['skillSets'] as List<TechStack>,
    );
  }

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['result']['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      studentId: json['studentId'] as int,
      title: json['title'] as String,
      startMonth: json['startMonth'] as String,
      endMonth: json['endMonth'] as String,
      description: json['description'] as String,
      skillSets: json['skillSets'] as List<TechStack>
    );
  }
}

class TechStack {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  String name;

  TechStack({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'name': this.name,
    };
  }

  factory TechStack.fromMap(Map<String, dynamic> map) {
    return TechStack(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      name: map['name'] as String,
    );
  }

  factory TechStack.fromJson(Map<String, dynamic> json) {
    return TechStack(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      name: json['name'] as String,
    );
  }

}

class TechStackList {
  List<TechStack> techStackList;

  TechStackList({required this.techStackList});

  factory TechStackList.fromJson(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return TechStackList(techStackList: []);
    } else
      return TechStackList(
        techStackList: (json['result'] as List).map((e) => TechStack.fromJson(e)).toList(),
      );
  }
}

class Language {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int studentId;
  String languageName;
  String level;

  Language({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentId,
    required this.languageName,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'studentId': this.studentId,
      'languageName': this.languageName,
      'level': this.level,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      studentId: map['studentId'] as int,
      languageName: map['languageName'] as String,
      level: map['level'] as String,
    );
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      id: json['result']['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      studentId: json['studentId'] as int,
      languageName: json['languageName'] as String,
      level: json['level'] as String,
    );
  }
}

class Proposal {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int projectId;
  int studentId;
  String coverLetter;
  int statusFlag;
  int disableFlag;
  Student student;

  Proposal({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.projectId,
    required this.studentId,
    required this.coverLetter,
    required this.statusFlag,
    required this.disableFlag,
    required this.student,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'projectId': this.projectId,
      'studentId': this.studentId,
      'coverLetter': this.coverLetter,
      'statusFlag': this.statusFlag,
      'disableFlag': this.disableFlag,
      'student': this.student,
    };
  }

  factory Proposal.fromMap(Map<String, dynamic> map) {
    return Proposal(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      projectId: map['projectId'] as int,
      studentId: map['studentId'] as int,
      coverLetter: map['coverLetter'] as String,
      statusFlag: map['statusFlag'] as int,
      disableFlag: map['disableFlag'] as int,
      student: map['student'] as Student,
    );
  }

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      id: json['result']['id'] as int,
      createdAt: json['result']['createdAt'] as String,
      updatedAt: json['result']['updatedAt'] as String,
      deletedAt: json['result']['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      projectId: json['result']['projectId'] as int,
      studentId: json['result']['studentId'] as int,
      coverLetter: json['result']['coverLetter'] as String,
      statusFlag: json['result']['statusFlag'] as int,
      disableFlag: json['result']['disableFlag'] as int,
      student: Student.fromMap(json['result']['student']),
    );
  }
}

class Student {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  int userId;
  String fullname;
  int techStackId;
  dynamic resume;
  dynamic transcript;
  TechStack techStack;
  List<dynamic> educations;

  Student({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.fullname,
    required this.techStackId,
    required this.resume,
    required this.transcript,
    required this.techStack,
    required this.educations,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'userId': this.userId,
      'fullname': this.fullname,
      'techStackId': this.techStackId,
      'resume': this.resume,
      'transcript': this.transcript,
      'techStack': this.techStack,
      'educations': this.educations,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      userId: map['userId'] as int,
      fullname: map['fullname'] as String,
      techStackId: map['techStackId'] as int,
      resume: map['resume'] as dynamic,
      transcript: map['transcript'] as dynamic,
      techStack: map['techStack'] as TechStack,
      educations: map['educations'] as List<dynamic>,
    );
  }
}

class SkillSet {
  int id;
  String createdAt;
  String updatedAt;
  String? deletedAt;
  String name;

  SkillSet({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'deletedAt': this.deletedAt,
      'name': this.name,
    };
  }

  factory SkillSet.fromJson(Map<String, dynamic> json) {
    return SkillSet(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] == null ? null : json['result']['deletedAt'] as String,
      name: json['name'] as String,
    );  
  }

  factory SkillSet.fromMap(Map<String, dynamic> map) {
    return SkillSet(
      id: map['id'] as int,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      deletedAt: map['deletedAt'] == null ? null : map['deletedAt'] as String,
      name: map['name'] as String,
    );
  }
}

class SkillSetList {
  List<SkillSet> skillSetList;

  SkillSetList({required this.skillSetList});

  factory SkillSetList.fromJson(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return SkillSetList(skillSetList: []);
    } else
      return SkillSetList(
        skillSetList: (json['result'] as List).map((e) => SkillSet.fromJson(e)).toList(),
      );
  }
}