import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class ChatState extends WidgetState {
  final String? message;
  final bool? messageReceived;
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
      messageReceived: json['messageReceived'] as bool?,
    );
  }

  ChatState copyWith({
    String? message,
    bool? messageReceived,
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
