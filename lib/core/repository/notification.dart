
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/favorite_project_model.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/models/output/notification.dart';
import 'package:student_hub/core/models/output/project_model.dart';
import 'package:student_hub/core/repository/base.dart';


class NotificationRepository extends BaseRepository {
  NotificationRepository() : super('/notification');

    Future<DataState<List<NotificationOutput>>> getNotifications(int id) async {
    return get<List<NotificationOutput>>(
      path: '/getByReceiverId/$id',
      parseJsonFunction: NotificationOutput.fromJsonList,
    );
  }
    


}