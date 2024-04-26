class ProposalPostForm {
  
  // "projectId": 1,
  // "studentId": 1,
  // "coverLetter": "This is a sample cover letter for the proposal",


  final int? projectId;
  final int? studentId;
  final String? coverLetter;

  ProposalPostForm({
    this.projectId,
    this.studentId,
    this.coverLetter,
  });

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'studentId': studentId,
      'coverLetter': coverLetter,
    };
  }

  factory ProposalPostForm.fromMap(Map<String, dynamic> map) {
    return ProposalPostForm(
      projectId: map['projectId'],
      studentId: map['studentId'],
      coverLetter: map['coverLetter'],
    );
  }

  ProposalPostForm copyWith({
    int? projectId,
    int? studentId,
    String? coverLetter,
  }) =>
      ProposalPostForm(
        projectId: projectId ?? this.projectId,
        studentId: studentId ?? this.studentId,
        coverLetter: coverLetter ?? this.coverLetter,
      );

  ProposalPostForm.fromJson(Map<String, dynamic> json)
      : projectId = json['projectId'],
        studentId = json['studentId'],
        coverLetter = json['coverLetter'];

  Map<String, dynamic> toJson() => {
        'projectId': projectId,
        'studentId': studentId,
        'coverLetter': coverLetter,
      };
  
}

class ProposalPatchForm{
  //   "projectId": 1,
  // "studentId": 1,
  // "coverLetter": "This is a update cover letter for the proposal",
  // "statusFlag": 1,
  // "disableFlag": 1

  final int projectId;
  final int studentId;
  final String coverLetter;
  final int statusFlag;
  final int disableFlag;

  ProposalPatchForm({
    required this.projectId,
    required this.studentId,
    required this.coverLetter,
    required this.statusFlag,
    required this.disableFlag,
  });

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'studentId': studentId,
      'coverLetter': coverLetter,
      'statusFlag': statusFlag,
      'disableFlag': disableFlag,
    };
  }

  factory ProposalPatchForm.fromMap(Map<String, dynamic> map) {
    return ProposalPatchForm(
      projectId: map['projectId'],
      studentId: map['studentId'],
      coverLetter: map['coverLetter'],
      statusFlag: map['statusFlag'],
      disableFlag: map['disableFlag'],
    );
  }

  ProposalPatchForm copyWith({
    int? projectId,
    int? studentId,
    String? coverLetter,
    int? statusFlag,
    int? disableFlag,
  }) =>
      ProposalPatchForm(
        projectId: projectId ?? this.projectId,
        studentId: studentId ?? this.studentId,
        coverLetter: coverLetter ?? this.coverLetter,
        statusFlag: statusFlag ?? this.statusFlag,
        disableFlag: disableFlag ?? this.disableFlag,
      );


  ProposalPatchForm.fromJson(Map<String, dynamic> json)
      : projectId = json['projectId'],
        studentId = json['studentId'],
        coverLetter = json['coverLetter'],
        statusFlag = json['statusFlag'],
        disableFlag = json['disableFlag'];

}

