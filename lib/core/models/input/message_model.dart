 
 	
// {
//     "projectId": 1,
//     "content": "Hello World",
//     "messageFlag": 0,
//     "senderId": 1,
//     "receiverId": 2
// }

class MessageInput {
  int? projectId;
  String? content;
  int? messageFlag;
  int? senderId;
  int? receiverId;

  MessageInput({
    this.projectId,
    this.content,
    this.messageFlag,
    this.senderId,
    this.receiverId,
  });

  MessageInput.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'];
    content = json['content'];
    messageFlag = json['messageFlag'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = projectId;
    data['content'] = content;
    data['messageFlag'] = messageFlag;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    return data;
  }


  MessageInput copyWith({
    int? projectId,
    String? content,
    int? messageFlag,
    int? senderId,
    int? receiverId,
  }) {
    return MessageInput(
      projectId: projectId ?? this.projectId,
      content: content ?? this.content,
      messageFlag: messageFlag ?? this.messageFlag,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
    );
  }

  
}

// {
//   "title": "string",
//   "content": "string",
//   "startTime": "2024-05-09T04:07:41.427Z",
//   "endTime": "2024-05-09T04:07:41.427Z",
//   "projectId": {},
//   "senderId": {},
//   "receiverId": {},
//   "meeting_room_code": "string",
//   "meeting_room_id": "string",
//   "expired_at": "2024-05-09T04:07:41.427Z"
// }

class InterviewInput{
  String? title;
  String? content;
  String? startTime;
  String? endTime;
  int? projectId;
  int? senderId;
  int? receiverId;
  String? meetingRoomCode;
  String? meetingRoomId;
  String? expiredAt;

  InterviewInput({
    this.title,
    this.content,
    this.startTime,
    this.endTime,
    this.projectId,
    this.senderId,
    this.receiverId,
    this.meetingRoomCode,
    this.meetingRoomId,
    this.expiredAt,
  });

  InterviewInput.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    projectId = json['projectId'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    meetingRoomCode = json['meeting_room_code'];
    meetingRoomId = json['meeting_room_id'];
    expiredAt = json['expired_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['projectId'] = projectId;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['meeting_room_code'] = meetingRoomCode;
    data['meeting_room_id'] = meetingRoomId;
    data['expired_at'] = expiredAt;
    return data;
  }

  InterviewInput copyWith({
    String? title,
    String? content,
    String? startTime,
    String? endTime,
    int? projectId,
    int? senderId,
    int? receiverId,
    String? meetingRoomCode,
    String? meetingRoomId,
    String? expiredAt,
  }) {
    return InterviewInput(
      title: title ?? this.title,
      content: content ?? this.content,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      projectId: projectId ?? this.projectId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      meetingRoomCode: meetingRoomCode ?? this.meetingRoomCode,
      meetingRoomId: meetingRoomId ?? this.meetingRoomId);
  }
}

// {
//   "meeting_room_code": "string",
//   "meeting_room_id": "string",
//   "expired_at": "2024-05-09T04:26:31.084Z"
// }

class MeetingRoomInput{
  String? meetingRoomCode;
  String? meetingRoomId;
  String? expiredAt;

  MeetingRoomInput({
    this.meetingRoomCode,
    this.meetingRoomId,
    this.expiredAt,
  });

  MeetingRoomInput.fromJson(Map<String, dynamic> json) {
    meetingRoomCode = json['meeting_room_code'];
    meetingRoomId = json['meeting_room_id'];
    expiredAt = json['expired_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meeting_room_code'] = meetingRoomCode;
    data['meeting_room_id'] = meetingRoomId;
    data['expired_at'] = expiredAt;
    return data;
  }

  MeetingRoomInput copyWith({
    String? meetingRoomCode,
    String? meetingRoomId,
    String? expiredAt,
  }) {
    return MeetingRoomInput(
      meetingRoomCode: meetingRoomCode ?? this.meetingRoomCode,
      meetingRoomId: meetingRoomId ?? this.meetingRoomId,
      expiredAt: expiredAt ?? this.expiredAt,
    );
  }
}