
    // "result": [
    //     {
    //         "id": 4,
    //         "createdAt": "2024-04-02T13:37:42.952Z",
    //         "content": "haha",
    //         "sender": {
    //             "id": 7,
    //             "fullname": "Nguyen Thi Ngoc Hong"
    //         },
    //         "receiver": {
    //             "id": 2,
    //             "fullname": "Nguyen Thi Ngoc Hai"
    //         },
    //                 "interview": {
    //                     "id": 1,
    //                     "createdAt": "2024-04-02T14:46:44.235Z",
    //                     "updatedAt": "2024-04-02T14:46:44.235Z",
    //                     "deletedAt": null,
    //                     "title": "Interview",
    //                     "startTime": "2024-04-02T01:00:00.000Z",
    //                     "endTime": "2024-04-02T05:00:00.000Z",
    //                     "disableFlag": 0
    //                 }
    //     },
    //     {
    //         "id": 2,
    //         "createdAt": "2024-04-02T13:40:42.952Z",
    //         "content": "i want apply project",
    //         "sender": {
    //             "id": 3,
    //             "fullname": "Nguyen Thi Thu Ha"
    //         },
    //         "receiver": {
    //             "id": 7,
    //             "fullname": "Nguyen Thi Ngoc Hong"
    //         },
    //         "interview": null
    //     }
    // ]
import 'package:student_hub/core/models/output/project_model.dart';

class MessageOutput {
  int? id;
  String? createdAt;
  String? content;
  int? senderId;
  int? receiverId;
  String? senderName;
  String? receiverName;
  Interview? interview;

  MessageOutput({
    this.id,
    this.createdAt,
    this.content,
    this.senderId,
    this.receiverId,
    this.senderName,
    this.receiverName,
    this.interview,
  });


  MessageOutput.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    content = json['content'];
    senderId = json['sender']['id'];
    senderName = json['sender']['fullname'];
    receiverId = json['receiver']['id'];
    receiverName = json['receiver']['fullname'];
    if (json['interview'] != null) {
      interview = Interview.fromJson(json['interview']);
    }
  }
  
  static List<MessageOutput> fromJsonList(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return [];
    } else
      return (json['result'] as List).map((e) => MessageOutput.fromJson(e)).toList();
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['content'] = content;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['senderName'] = senderName;
    data['receiverName'] = receiverName;
    if (interview != null) {
      data['interview'] = interview?.toJson();
    }
    return data;
  }
}

class Interview {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? title;
  String? startTime;
  String? endTime;
  int? disableFlag;
  int? meetingRoomId;
  String? meetingRoomCode;

  Interview({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.startTime,
    this.endTime,
    this.disableFlag,
    this.meetingRoomId,
    this.meetingRoomCode,
  });

  Interview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    title = json['title'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    disableFlag = json['disableFlag'];
    meetingRoomId = json['meetingRoomId'];
    meetingRoomCode = json['meetingRoom']['meeting_room_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['title'] = title;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['disableFlag'] = disableFlag;
    data['meetingRoomId'] = meetingRoomId;
    return data;
  }
}

class MessageWithProject extends MessageOutput{

  ProjectOutput? project;

  MessageWithProject({
    this.project,
  });

  MessageWithProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    content = json['content'];
    senderId = json['sender']['id'];
    senderName = json['sender']['fullname'];
    receiverId = json['receiver']['id'];
    receiverName = json['receiver']['fullname'];
    if (json['interview'] != null) {
      interview = Interview.fromJson(json['interview']);
    }
    project = ProjectOutput.fromJson(json['project']);
  }

  static List<MessageWithProject> fromJsonList(Map<String, dynamic> json) {
    if (json['result'] == null) {
      return [];
    } else
      return (json['result'] as List).map((e) => MessageWithProject.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['content'] = content;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['senderName'] = senderName;
    data['receiverName'] = receiverName;
    if (interview != null) {
      data['interview'] = interview?.toJson();
    }
    data['project'] = project?.toJson();
    return data;
  }


}

