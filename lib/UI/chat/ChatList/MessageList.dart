import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/repository/interview.dart';
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
  final _interview = getIt.get<InterviewRepository>();
  List<MessageWithProject>? messages = [];
  int userId = -1;
  List<Interview>? interviews = [];

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

    final result2 = await _interview.getActiveInterview(userId);
    if (result2 is DataSuccess) {
      setState(() {
        interviews = result2.data;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Student Hub'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Messages'),
              Tab(text: 'Interviews'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.router.replace(const SwitchAccountPageRoute());
              },
              icon: const Icon(
                Icons.account_circle,
                size: 40.0,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildMessageContent(),
                  _buildInterviewContent(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomAppBar(selectedTab: "Messages"),
      ),
    );
  }

  Widget _buildMessageContent() {
    return ListView.separated(
      itemCount: messages?.length ?? 0,
      separatorBuilder: (context, index) => const Divider(color: Colors.black),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.router.push(MessageDetailScreenRoute(
              userId: userId,
              receiverId: messages![index].receiverId! == userId
                  ? messages![index].senderId!
                  : messages![index].receiverId!,
              projectId: messages![index].project!.projectId!,
              receiverName: messages![index].receiverId == userId
                  ? messages![index].senderName!
                  : messages![index].receiverName!,
            ));
          },
          child: ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: Text(messages![index].receiverId == userId
                ? messages![index].senderName ?? ''
                : messages![index].receiverName ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messages![index].project!.title ?? '',
                  style: const TextStyle(color: Colors.green),
                ),
                Text(messages![index].content ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

Widget _buildInterviewContent() {
  return ListView.separated(
    itemCount: interviews?.length ?? 0,
    separatorBuilder: (context, index) => const Divider(color: Colors.black),
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(interviews![index].title ?? 'No Title'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Start: ${DateFormat('kk:mm – dd-MM-yyyy').format(DateTime.parse(interviews![index].startTime!))}'),
            Text('End: ${DateFormat('kk:mm – dd-MM-yyyy').format(DateTime.parse(interviews![index].endTime!))}'),
            Text('Room Code: ${interviews![index].meetingRoomId ?? 'No Room Code'}'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add your join logic here, for example:
            print('Joining interview ${interviews![index].title}');
            print('Joining interview code ${interviews![index].meetingRoomCode}');
            context.router.push(VideoCallScreenRoute(channelName: interviews![index].title ?? '', tempToken: interviews![index].meetingRoomCode));
          },
          child: const Text('Join'),
        ),
      );
    },
  );
}
}
