import 'dart:convert';
import 'dart:io';

import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/models/output/student_profile.dart';


class StudentProfileRepository extends BaseRepository {
  StudentProfileRepository() : super('/profile/student');

  Future<DataState<StudentProfile>> inputStudentProfile(TechStackForm input) async {
    return post<StudentProfile>(
      path: '',
      parseJsonFunction: StudentProfile.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<StudentProfile>> editStudentProlfile(TechStackForm input, int id) async {
    return put<StudentProfile>(
      path: '/$id',
      parseJsonFunction: StudentProfile.fromJson,
      data: input.toJson(),
    );
  }

  Future<DataState<StudentProfile>> getStudentProfile(int id) async {
    return get<StudentProfile>(
      path: '/$id',
      parseJsonFunction: StudentProfile.fromJson,
    );
  }

  Future<DataState<StudentProfile>> inputStudentCV(File cv, int id) async {
    return putFile<StudentProfile>(
      path: '/$id/resume',
      parseJsonFunction: StudentProfile.fromJson,
      data: cv,
    );
  }

  Future<DataState<StudentProfile>> inputStudentTranscript(File transcript, int id) async {
    return putFile<StudentProfile>(
      path: '/$id/transcript',
      parseJsonFunction: StudentProfile.fromJson,
      data: transcript,
    );
  }

  
  Future<DataState<StudentProfile>> inputStudentExperience(List<ExperienceInput> experience, int id) async {
  // Convert list of ExperienceInput objects to JSON string
  List<Map<String, dynamic>> experienceJsonList = experience.map((exp) => exp.toJson()).toList();

  // Create a map where the key is the parameter expected by the API and the value is the list of experiences
  Map<String, dynamic> requestData = {
    'experience': jsonEncode(experienceJsonList), // Assuming 'experience' is the expected key for the list of experiences
  };

  // Use requestData as the data parameter for the put method
  return put<StudentProfile>(
    path: 'experience/updateByStudentId/$id/',
    parseJsonFunction: StudentProfile.fromJson,
    data: requestData,
  );
}



}