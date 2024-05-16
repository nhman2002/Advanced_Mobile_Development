import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';

import 'package:student_hub/core/repository/base.dart';

class GeneralRepository extends BaseRepository {
  GeneralRepository() : super('');
  //experience/updateByStudentId/201

  Future<DataState> putExperience(ExperienceList form, int id) async {
    return put(
      path: '/experience/updateByStudentId/$id',
      parseJsonFunction: ExperienceInput.fromJson,
      data: form.toJson(),
    );
  }

  Future<DataState<ExperienceList>> getExperience(int id) async {
    return get(
      path: '/experience/getByStudentId/$id',
      parseJsonFunction: ExperienceList.fromJson,
    );
  }
    // missing techStack, transcript, resume API


  // Future<DataState<String>>getTranscript (int id) async{
  //   return get(
  //      path: '/profile/student/$id/transcript',
  //     parseJsonFunction: ,);
  // }

  Future<DataState<EducationList>> getEducation(int id) async {
    return get(
      path: '/education/getByStudentId/$id',
      parseJsonFunction: EducationList.fromJson,
    );
  }

  //education/updateByStudentId/201
  Future<DataState> putEducation(EducationList form, int id) async {
    return put(
      path: '/education/updateByStudentId/$id',
      parseJsonFunction: EducationInput.fromJson,
      data: form.toJson(),
    );
  }

  Future<DataState<List<LanguageInput>>> getLanguage(int id) async {
    return get<List<LanguageInput>>(
      path: '/language/getByStudentId/$id',
      parseJsonFunction: LanguageInput.fromJsonList,
    );
  }

  //language/updateByStudentId/201

  Future<DataState> putLanguage(LanguageList form, int id) async {
    return put(
      path: '/language/updateByStudentId/$id',
      parseJsonFunction: LanguageInput.fromJson,
      data: form.toJson(),
    );
  }
}
