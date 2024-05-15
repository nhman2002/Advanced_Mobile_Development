import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/message_model.dart';
import 'package:student_hub/core/models/output/message_output.dart';

import 'package:student_hub/core/repository/base.dart';

class InterviewRepository extends BaseRepository {
  InterviewRepository() : super('/interview');


  Future<DataState> postInterview(InterviewInput form) async {
    return post(
      path: '',
      parseJsonFunction: InterviewInput.fromJson,
      data: form.toJson(),
    );
  }


  Future<DataState<List<Interview>>> getActiveInterview(int id) async {
    return get<List<Interview>>(
      path: '/user/$id',
      parseJsonFunction: Interview.fromJsonList,
    );
  }

  Future<DataState> deleteInterview(int id) async {
    return delete(
      path: '/$id',
      parseJsonFunction: Interview.fromJson,
    );
  }

  Future<DataState> updateInterview(InterviewInput form, int id) async {
    return put(
      path: '/$id',
      parseJsonFunction: InterviewInput.fromJson,
      data: form.toJson(),
    );
  }
}