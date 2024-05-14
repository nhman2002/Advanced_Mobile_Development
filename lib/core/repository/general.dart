import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/student_profile_model.dart';

import 'package:student_hub/core/repository/base.dart';

class GeneralRepository extends BaseRepository {
  GeneralRepository() : super('');
  //experience/updateByStudentId/201

  Future<DataState> postExperience(ExperienceInput form, int id) async {
    return post(
      path: '/experience/updateByStudentId/$id',
      parseJsonFunction: ExperienceInput.fromJson,
      data: form.toJson(),
    );
  }

  //education/updateByStudentId/201

  Future<DataState> postEducation(EducationInput form, int id) async {
    return post(
      path: '/education/updateByStudentId/$id',
      parseJsonFunction: EducationInput.fromJson,
      data: form.toJson(),
    );
  }

  //language/updateByStudentId/201

  Future<DataState> postLanguage(LanguageInput form, int id) async {
    return post(
      path: '/language/updateByStudentId/$id',
      parseJsonFunction: LanguageInput.fromJson,
      data: form.toJson(),
    );
  }











}




