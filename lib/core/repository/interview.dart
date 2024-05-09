import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/message_model.dart';

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
}