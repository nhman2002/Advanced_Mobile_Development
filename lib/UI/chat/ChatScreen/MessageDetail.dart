import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import package intl
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocBuilder
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_cubit.dart';
import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_state.dart';
import 'package:student_hub/UI/chat/ChatScreen/widget/ScheduleMeeting.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/output/message_output.dart';

@RoutePage()
class MessageDetailScreen extends BaseWidget<ChatCubit, ChatState> {
  final int userId;
  final int receiverId;
  final int projectId;
  final String receiverName;

  const MessageDetailScreen({
    Key? key,
    required this.userId,
    required this.receiverId,
    required this.projectId,
    required this.receiverName,
  }) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return const ChatWidget();
  }

  @override
  ChatCubit? provideCubit(BuildContext context) {
    return ChatCubit(
        userId: userId,
        receiverId: receiverId,
        projectId: projectId,
        receiverName: receiverName);
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<ChatWidget> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  void initState() {
    super.initState();
    // Use a PostFrameCallback to call scrollToBottom after everything is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //2 seconds delay
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          scrollToBottom();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context.read<ChatCubit>().receiverName),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) async {
          // Add listener when state.messages is updated, update UI
          if (state.messageReceived == true) {
            await context.read<ChatCubit>().init();
            if (_scrollController.position.pixels !=
                _scrollController.position.maxScrollExtent) {
              // Scroll to the bottom
              scrollToBottom();
            }
          }
        },
        builder: (context, state) {
          final List<MessageOutput> _messages = state.messages;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    reverse: false,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return _buildMessageItem({
                        'isSender': message.senderId ==
                            context.read<ChatCubit>().userId,
                        'name': message.senderName,
                        'text': message.content,
                        'time': message.createdAt,
                        'interview': message.interview
                      });
                    },
                  ),
                ),
                _buildMessageInput(context),
              ],
            ),
          );
        },
      ),
    );
  }

  void scrollToBottom() {
    final bottomOffset = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }Widget _buildMessageItem(Map<String, dynamic> message) {
  // Check if the message contains interview information
  if (message['interview'] != null) {
    final interview = message['interview'];
    final title = interview.title;
    final content = message['text'];
    final start = interview.startTime;
    final end = interview.endTime;
    final roomId = interview.meetingRoomId;
    final userRole = _localStorage.getString(key: StorageKey.currentRole);
    final channelName = interview.meetingRoomCode;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: message['isSender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: message['isSender'] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.brown,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: message['isSender'] ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Start: $start\nEnd: $end\nRoom ID: $roomId',
                  style: TextStyle(
                    fontSize: 12,
                    color: message['isSender'] ? Colors.white70 : Colors.grey,
                  ),
                ),
                  ElevatedButton(
                    onPressed: () {
                      context.router.replace(VideoCallScreenRoute(channelName: channelName));
                    },
                    child: Text('Join Interview'),
                  ),
              ],
            ),
          ),
          if (userRole != "0") // If user role is not "0" (e.g., admin), show PopupMenuButton
            SizedBox(width: 8),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 'edit',
                ),
                PopupMenuItem(
                  child: Text('Cancel Interview'),
                  value: 'cancel',
                ),
              ],
              onSelected: (value) {
                if (value == 'edit') {
                  _editInterview(context, interview);
                } else if (value == 'cancel') {
                  _cancelInterview(context, interview);
                }
              },
            ),
        ],
      ),
    );
  } else {
    // If interview is null, build the default message item
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: message['isSender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: message['isSender'] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message['isSender']) ...[
            Icon(Icons.verified_user_rounded),
            SizedBox(width: 8),
          ],
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: message['isSender'] ? Colors.blue : Colors.grey.shade300,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!message['isSender'])
                  Text(
                    message['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                Text(
                  message['text'],
                  style: TextStyle(
                    color: message['isSender'] ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),
          if (message['isSender']) ...[
            SizedBox(width: 8),
            Icon(Icons.verified_user_rounded),
          ],
        ],
      ),
    );
  }
}


void _editInterview(BuildContext context, Map<String, dynamic> interview) {
  // Implement edit interview logic
}

void _cancelInterview(BuildContext context, Map<String, dynamic> interview) {
  // Implement cancel interview logic
}
Widget _buildMessageInput(BuildContext context) {
  final chatCubit = context.read<ChatCubit>();
  final projectId = chatCubit.projectId;
  final userId = chatCubit.userId;
  final receiverId = chatCubit.receiverId;
  final currentRole = _localStorage.getString(key: StorageKey.currentRole);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        if (currentRole != '0') // Check if the current role is not 0
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ScheduleDialog(
                    projectId: projectId,
                    senderId: userId,
                    receiverId: receiverId,
                    onScheduleSuccess: () {
                      chatCubit.receiveMessageUpdate();
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.schedule),
            color: Colors.blue,
          ),
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type your message...',
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _sendMessage(_messageController.text);
          },
          icon: Icon(
            Icons.send,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
  Future<void> _sendMessage(String message) async {
    print('Sending message: $message');
    if (message.isNotEmpty) {
      // Add logic to send message via ChatCubit
      await context.read<ChatCubit>().sendMessage(message);
      _messageController.clear();
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    if (time.isAfter(today)) {
      return DateFormat.Hm().format(time); // Sử dụng DateFormat từ package intl
    } else if (time.isAfter(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d').format(time);
    }
  }

  AppBar _buildAppBar(String name) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
