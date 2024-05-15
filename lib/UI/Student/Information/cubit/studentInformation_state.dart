import 'package:flutter/foundation.dart';
import 'package:student_hub/UI/Student/Information/cubit/StudentInformation_cubit.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class StudentInformationState extends WidgetState {
  final List<Proposal> proposalList;
  final List<TechStack> techStackList;
  final List<Language> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final String? resume;
  final String? transcript;
  final String? username;
  final String? message;

  const StudentInformationState({
    this.proposalList = const [],
    this.techStackList = const [],
    this.languages = const [],
    this.educations = const [],
    this.experiences = const [],
    this.resume,
    this.transcript,
    this.username,
    this.message,
  });

  @override
  List<Object?> get props => [
        proposalList,
        techStackList,
        languages,
        educations,
        experiences,
        resume,
        transcript,
        username,
        message,
      ];

  get fromJson => null;

  @override
  Map<String, dynamic> toJson() {
    return {
      // 'proposalList': proposalList.map((e) => e?.toJson()).toList(),
      'username': username,
      'message': message ?? '',
    };
  }

  factory StudentInformationState.fromJson(Map<String, dynamic> json) {
    return StudentInformationState(
      username: json['username'] as String?,
      message: json['message'] as String?,
    );
  }

  StudentInformationState copyWith({
    final List<Proposal>? proposalList,
    final List<TechStack>? techStackList,
    final List<Language>? languages,
    final List<Education>? educations,
    final List<Experience>? experiences,
    final String? resume,
    final String? transcript,
    final String? username,
    final String? message, List<ProposalWithProject>? activeProposalList, List<ProposalWithProject>? workingProposalList, List<ProposalWithProject>? archievedProposalList,
  }) {
    return StudentInformationState(
      proposalList: proposalList ?? this.proposalList,
      techStackList: techStackList ?? this.techStackList,
      languages: languages ?? this.languages,
      educations: educations ?? this.educations,
      experiences: experiences ?? this.experiences,
      resume: resume ?? this.resume,
      transcript: transcript ?? this.transcript,
      username: username ?? this.username,
      message: message ?? this.message,
    );
  }
}
