import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/error_model.dart';
import 'package:student_hub/core/models/input/message_model.dart';

import 'package:student_hub/core/repository/base.dart';

class MeetingRoomRepository extends BaseRepository {
  MeetingRoomRepository() : super('/meeting-room');

  //post meetingroom
  Future<DataState> postMeetingRoom(MeetingRoomInput form) async {
    return customPost(
      path: '/meeting-room/create-room',
      parseJsonFunction: ErrorModel.fromJson,
      data: form.toJson(),
    );
  }

  //check availability
  Future<DataState> checkAvailability(String roomId, String roomCode) async {
    return customGet(
      path: '/meeting-room/check-availability?meeting_room_code=$roomCode&meeting_room_id=$roomId',
      parseJsonFunction: ErrorModel.fromJson,
    );
  }


}

