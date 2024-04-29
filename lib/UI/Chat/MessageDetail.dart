import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import package intl

class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({Key? key}) : super(key: key);

  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'name': 'Luis Pham',
      'isSender': false,
      'text': 'Em co thai roi',
      'time': DateTime.now(),
    },
    {
      'name': 'Me',
      'isSender': true,
      'text': 'Minh chia tay di',
      'time': DateTime.now().subtract(Duration(hours: 1)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _buildMessageItem(_messages[index]);
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment:
          message['isSender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            message['isSender'] ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message['isSender']) ...[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 20,
            ),
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
                Text(
                  _formatTime(message['time']),
                  style: TextStyle(
                    fontSize: 12,
                    color: message['isSender'] ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (message['isSender']) ...[
            SizedBox(width: 8),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 20,
            ),
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

  void _sendMessage(String message) {
    print('Sending message: $message');
    if (message.isNotEmpty) {
      _messages.insert(
        0,
        {
          'name': 'Me',
          'isSender': true,
          'text': message,
          'time': DateTime.now(),
        },
      );
      _messageController.clear();
      setState(() {});
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

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Luis Pham"),
          Icon(Icons.more_vert),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}


void main() {
  runApp(MaterialApp(home: MessageDetailScreen()));
}
