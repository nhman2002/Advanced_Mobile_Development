import 'dart:io';

import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class StudentProfileInputState extends WidgetState {
  final String? message;
  final List<TechStack?> techStackList;
  final List<SkillSet> skillSetList;
  final int? selectedTechStackId;
  final List<String> selectedSkillSetList;
  final String? cvPath;
  final String? transcriptPath;
  final bool? isSuccess;
  final ExperienceList? experienceList;
  final LanguageList? languageList;
  final EducationList? educationList;


  const StudentProfileInputState({
    this.techStackList = const [],
    this.message,
    this.skillSetList = const [],
    this.selectedTechStackId,
    this.selectedSkillSetList = const [],
    this.cvPath,
    this.transcriptPath,
    this.isSuccess,
    this.experienceList,
    this.languageList,
    this.educationList,
  });

  @override
  List<Object?> get props => [
  message
  ,techStackList
  ,skillSetList
  ,selectedTechStackId
  ,selectedSkillSetList
  ,cvPath
  ,transcriptPath
  ,isSuccess
  ,experienceList
  ,languageList
  ,educationList
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message ?? '',
    };
  }

  factory StudentProfileInputState.fromJson(Map<String, dynamic> json) {
    return StudentProfileInputState(
      message: json['message'] as String?,
    );
  }

  StudentProfileInputState copyWith({
    String? message,
    List<TechStack?>? techStackList,
    List<SkillSet>? skillSetList,
    int? selectedTechStackId,
    List<String>? selectedSkillSetList,
    String? cvPath,
    String? transcriptPath,
    bool? isSuccess,
    ExperienceList? experienceList,
    LanguageList? languagesList,
    EducationList? educationList,

  }) {
    return StudentProfileInputState(
      message: message ?? this.message,
      techStackList: techStackList ?? this.techStackList,
      skillSetList: skillSetList ?? this.skillSetList,
      selectedTechStackId: selectedTechStackId ?? this.selectedTechStackId,
      selectedSkillSetList: selectedSkillSetList ?? this.selectedSkillSetList,
      cvPath: cvPath ?? this.cvPath,
      transcriptPath: transcriptPath ?? this.transcriptPath,
      isSuccess: isSuccess ?? this.isSuccess,
      experienceList: experienceList ?? this.experienceList,
      languageList: languagesList ?? this.languageList,
      educationList: educationList ?? this.educationList,
    );
  }
}