import 'package:flutter/material.dart';

void main() {
  runApp(MessageTab());
}

class MessageTab extends StatefulWidget {
  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  final List<Map<String, dynamic>> messages = [
    {
      'icon': Icons.message,
      'name': 'Luis Pham',
      'role': 'Senior frontend developer (Fintech)',
      'message': 'Clear expectation about your project or deliverables',
      'date': '6/6/2024'
    },
    {
      'icon': Icons.message,
      'name': 'Philips Truong',
      'role': 'Senior backend developer (Healthcare)',
      'message': 'Looking forward to working with you',
      'date': '19/4/2024'
    },
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Message Tab'),
        ),
        body: _buildMessageContent(),
      ),
    );
  }

  Widget _buildMessageContent() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: messages.length,
            separatorBuilder: (context, index) => Divider(color: Colors.black),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('Tile clicked');
                  // You can replace the print statement with your function
                },
                child: ListTile(
                  leading: Icon(
                      messages[index]['icon']), // Replace with actual icons
                  title: Text(messages[index]['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messages[index]['role'],
                        style: TextStyle(color: Colors.green), // Set text color to green
                      ),
                      Text(messages[index]['message']),
                    ],
                  ),
                  trailing: Text(messages[index]['date']),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}