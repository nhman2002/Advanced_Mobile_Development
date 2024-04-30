
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/repository/base.dart';


class MessageRepository extends BaseRepository {
  MessageRepository() : super('/message');

    Future<DataState<List<MessageOutput>>> getMessagesBetweenUser(int id, int projectId) async {
    return get<List<MessageOutput>>(
      path: '/$projectId/user/$id',
      parseJsonFunction: MessageOutput.fromJsonList,
    );
  }

  Future<DataState<List<MessageWithProject>>> getMessagesOfUser(){
    return get<List<MessageWithProject>>(
      path: '',
      parseJsonFunction: MessageWithProject.fromJsonList,
    );
  }


    
}