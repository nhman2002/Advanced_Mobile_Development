import 'package:student_hub/core/models/input/message_model.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/models/output/student_profile.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';
import 'package:student_hub/core/models/output/project_model.dart';

class ChatState extends WidgetState {
  final String? message;
  final String? messageReceived;
  final List<MessageOutput> messages;
  final bool? messageSent;

  const ChatState({
    this.message,
    this.messageReceived,
    this.messages = const [],
    this.messageSent,
  });

  @override
  List<Object?> get props => [
        message,
        messageReceived,
        messages,
        messageSent,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'messageReceived': messageReceived,
    };
  }

  factory ChatState.fromJson(Map<String, dynamic> json) {
    return ChatState(
      message: json['message'] as String?,
      messageReceived: json['messageReceived'] as String?,
    );
  }

  ChatState copyWith({
    String? message,
    String? messageReceived,
    List<MessageOutput>? messages,
    bool? messageSent,
  }) {
    return ChatState(
      message: message ?? this.message,
      messageReceived: messageReceived ?? this.messageReceived,
      messages: messages ?? this.messages,
      messageSent: messageSent ?? this.messageSent,
    );
  }
}
