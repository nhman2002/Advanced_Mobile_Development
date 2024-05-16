//  {
//       "id": 66,
//       "createdAt": "2024-04-28T15:04:11.514Z",
//       "updatedAt": "2024-04-28T15:04:11.514Z",
//       "deletedAt": null,
//       "receiverId": 3,
//       "senderId": 1,
//       "messageId": 43,
//       "title": "New message is sent by user 1",
//       "notifyFlag": "0",
//       "typeNotifyFlag": "3",
//       "content": "New message created",
//       "message": {
//         "id": 43,
//         "createdAt": "2024-04-28T15:04:11.402Z",
//         "updatedAt": "2024-04-28T15:04:11.402Z",
//         "deletedAt": null,
//         "senderId": 1,
//         "receiverId": 2,
//         "projectId": 1,
//         "interview": {
//           "id": 23,
//           "createdAt": "2024-04-28T15:04:11.385Z",
//           "updatedAt": "2024-04-28T16:08:07.763Z",
//           "deletedAt": "2024-04-28T16:08:07.545Z",
//           "title": "string",
//           "startTime": "2024-04-27T01:36:15.102Z",
//           "endTime": "2024-04-27T01:36:15.102Z",
//           "disableFlag": 0,
//           "meetingRoom": {
//             "id": 11,
//             "createdAt": "2024-04-28T15:04:11.369Z",
//             "updatedAt": "2024-04-28T15:04:11.369Z",
//             "deletedAt": null,
//             "meeting_room_code": "abcd",
//             "meeting_room_id": "abcd",
//             "expired_at": null
//           }
//         },
//         "content": "Interview created",
//         "messageFlag": 1
//       },
//       "sender": {
//         "id": 1,
//         "createdAt": "2024-04-07T12:47:07.652Z",
//         "updatedAt": "2024-04-25T02:57:41.413Z",
//         "deletedAt": null,
//         "email": "lethuynga1662002@gmail.com",
//         "fullname": "Teresa Pink",
//         "roles": [
//           0
//         ],
//         "verified": true,
//         "isConfirmed": true
//       },
//       "receiver": {
//         "id": 3,
//         "createdAt": "2024-04-15T12:44:47.472Z",
//         "updatedAt": "2024-04-25T02:14:43.050Z",
//         "deletedAt": null,
//         "email": "lethuynga1662002+2@gmail.com",
//         "fullname": "Teresa Pink",
//         "roles": [
//           0
//         ],
//         "verified": true,
//         "isConfirmed": true
//       },
      
//     },

class NotificationOutput {
  NotificationOutput({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.receiverId,
    this.senderId,
    this.messageId,
    this.title,
    this.notifyFlag,
    this.typeNotifyFlag,
    this.content,
  });

  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final int? receiverId;
  final int? senderId;
  final int? messageId;
  final String? title;
  final String? notifyFlag;
  final String? typeNotifyFlag;
  final String? content;


  factory NotificationOutput.fromJson(Map<String, dynamic> json) => NotificationOutput(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        receiverId: json["receiverId"],
        senderId: json["senderId"],
        messageId: json["messageId"],
        title: json["title"],
        notifyFlag: json["notifyFlag"],
        typeNotifyFlag: json["typeNotifyFlag"],
        content: json["content"],
      );

  static List<NotificationOutput> fromJsonList(Map<String, dynamic> json) {
    
      return (json['result'] as List).map((e) => NotificationOutput.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "receiverId": receiverId,
        "senderId": senderId,
        "messageId": messageId,
        "title": title,
        "notifyFlag": notifyFlag,
        "typeNotifyFlag": typeNotifyFlag,
        "content": content,

      };
}