import 'dart:io';

import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';
import 'package:student_hub/core/models/output/user_model.dart';
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

  Future<DataState<StudentProfileWithoutDate>> getStudentProfile(int id) async {
    return get<StudentProfileWithoutDate>(
      path: '/$id',
      parseJsonFunction: StudentProfileWithoutDate.fromJson,
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

  


}