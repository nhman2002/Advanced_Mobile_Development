 
 	
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