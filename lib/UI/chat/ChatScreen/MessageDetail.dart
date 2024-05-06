import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import package intl
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocBuilder
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_cubit.dart';
import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_state.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
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
          final List<MessageOutput> _messages =
              state.messages; // Get messages from state
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController, // Attach scroll controller
                    reverse:
                        false, // Reverse the list to show newer messages at the bottom
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return _buildMessageItem({
                        'isSender': message.senderId ==
                            context.read<ChatCubit>().userId,
                        'name': message.senderName,
                        'text': message.content,
                        'time': message.createdAt,
                      });
                    },
                  ),
                ),
                _buildMessageInput(),
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
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment:
          message['isSender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: message['isSender']
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message['isSender']) ...[
            // CircleAvatar(
            //   backgroundImage: Icons.verified_user_rounded.toi,
            //   radius: 20,
            // ),
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
                // Text(
                //   _formatTime(message['time']),
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: message['isSender'] ? Colors.white70 : Colors.grey,
                //   ),
                // ),
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

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
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
      backgroundColor: Colors.white,
    );
  }
}
