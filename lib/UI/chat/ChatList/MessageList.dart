import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/bottomNavigation/AnimatedButton.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Hub'),
          actions: [
            IconButton(
              onPressed: () {
                context.router.push(const SwitchAccountPageRoute());
              },
              icon: Icon(
                Icons.account_circle,
                size: 40.0,
              ),
            ),
          ],
        ),
        body: _buildMessageContent(),
        bottomNavigationBar: const CustomBottomAppBar(),
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


}
