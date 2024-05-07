import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/repository/message.dart';

@RoutePage()
class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  // final List<Map<String, dynamic>> messages = [
  //   {
  //     'icon': Icons.message,
  //     'name': 'Luis Pham',
  //     'role': 'Senior frontend developer (Fintech)',
  //     'message': 'Clear expectation about your project or deliverables',
  //     'date': '6/6/2024'
  //   },
  //   {
  //     'icon': Icons.message,
  //     'name': 'Philips Truong',
  //     'role': 'Senior backend developer (Healthcare)',
  //     'message': 'Looking forward to working with you',
  //     'date': '19/4/2024'
  //   },
  //   // Add more messages here
  // ];

  final _localStorage = getIt.get<LocalStorage>();
  final _message = getIt.get<MessageRepository>();
  List<MessageWithProject>? messages = [];
  int userId = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final id = _localStorage.getString(key: StorageKey.userID);
    if (id != null) {
      userId = int.parse(id);
    }
    final result = await _message.getMessagesOfUser();
    if (result is DataSuccess) {
      setState(() {
        messages = result.data;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Student Hub'),
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(const SwitchAccountPageRoute());
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ],
        ),
        body: _buildMessageContent(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCompanyDashboardItem(Icons.work, 'Projects',
                      Colors.white, Colors.blue.shade300),
                  _buildCompanyDashboardItem(Icons.dashboard, 'Dashboard',
                      Colors.white, Colors.blue.shade300),
                  _buildCompanyDashboardItem(Icons.message, 'Message',
                      Colors.black, Colors.grey.shade300),
                  _buildCompanyDashboardItem(Icons.notifications, 'Notifications',
                      Colors.white, Colors.blue.shade300),
                ],
              ),
            ),
          ),
        ),
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
            itemCount: messages!.length,
            separatorBuilder: (context, index) => Divider(color: Colors.black),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print('Tile clicked');
                  context.router.push(MessageDetailScreenRoute(
                      userId: userId,
                      receiverId: messages![index].receiverId! == userId
                          ? messages![index].senderId!
                          : messages![index].receiverId!,
                      projectId: messages![index].project!.projectId!,
                      receiverName: messages![index].receiverId == userId
                          ? messages![index].senderName!
                          : messages![index].receiverName!,));
                },
                child: ListTile(
                  leading: Icon(Icons
                      .supervised_user_circle), // Replace with actual icons
                  title: Text(messages![index].receiverId == userId
                      ? messages![index].senderName ?? ''
                      : messages![index].receiverName ?? ''
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messages![index].project!.title ?? '',
                        style: TextStyle(
                            color: Colors.green), // Set text color to green
                      ),
                      Text(messages![index].content ?? ''),
                    ],
                  ),
                ),

              );
              
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyDashboardItem(
      IconData icon, String label, Color color, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: AnimatedButton(
        icon: icon,
        label: label,
        color: color,
        bgColor: bgColor,
        onPressed: () {
          // Add onPressed logic here
          if (label == 'Projects') {
            context.router.push(const StudentSignupRoute());
          } else if (label == 'Dashboard') {
            context.router.push(const StudentSignupRoute());
          } else if (label == 'Message') {
            // context.router.push(const MessageListScreenRoute());
          } else if (label == 'Notifications') {
            context.router.push(const StudentSignupRoute());
          }
        },
      ),
    );
  }
}
