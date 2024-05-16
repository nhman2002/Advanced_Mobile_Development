import 'package:flutter/foundation.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_cubit.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class StudentInformationState extends WidgetState {
  final int? proposalId;
  final String? techStack;
  final List<SkillSet> skillSets;
  final List<LanguageInput> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final String? resume;
  final String? transcript;
  final String? username;
  final String? message;
  final String? resumeLink;
  final String? transcriptLink;

  const StudentInformationState({
    this.proposalId,
    this.techStack,
    this.skillSets = const [],
    this.languages = const [],
    this.educations = const [],
    this.experiences = const [],
    this.resume,
    this.transcript,
    this.username,
    this.message,
    this.resumeLink,
    this.transcriptLink,

  });

  @override
  List<Object?> get props => [
        proposalId,
        techStack,
        skillSets,
        languages,
        educations,
        experiences,
        resume,
        transcript,
        username,
        message,
        resumeLink,
        transcriptLink,
      ];


  @override
  Map<String, dynamic> toJson() {
    return {
      'proposalId': proposalId,
      'resume': resume,
      'transcript': transcript,
      'username': username,
      'message': message,
    };
  }

  factory StudentInformationState.fromJson(Map<String, dynamic> json) {
    return StudentInformationState(
      proposalId: json['proposalId'],
      techStack: json['techStack'],
      languages: json['languages'],
      educations: json['educations'],
      experiences: json['experiences'],
      resume: json['resume'],
      transcript: json['transcript'],
      username: json['username'],
      message: json['message'],
      resumeLink: json['resumeLink'],
      transcriptLink: json['transcriptLink'],
    );
  }

  StudentInformationState copyWith({
    final int? proposalId,
    final String? techStack,
    final List<SkillSet>? skillSets,
    final List<LanguageInput>? languages,
    final List<Education>? educations,
    final List<Experience>? experiences,
    final String? resume,
    final String? transcript,
    final String? username,
    final String? message,
    final String? resumeLink,
    final String? transcriptLink,
  }) {
    return StudentInformationState(
      proposalId: proposalId ?? this.proposalId,
      techStack: techStack ?? this.techStack,
      languages: languages ?? this.languages,
      skillSets: skillSets ?? this.skillSets,
      educations: educations ?? this.educations,
      experiences: experiences ?? this.experiences,
      resume: resume ?? this.resume,
      transcript: transcript ?? this.transcript,
      username: username ?? this.username,
      message: message ?? this.message,
      resumeLink: resumeLink ?? this.resumeLink,
      transcriptLink: transcriptLink ?? this.transcriptLink,
    );
  }
}
