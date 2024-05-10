import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hub/UI/notification/cubit/notification_cubit.dart';
import 'package:student_hub/UI/notification/cubit/notification_state.dart';
import 'package:student_hub/common/config/router.dart';
import 'package:student_hub/common/ui/base_snack_bar/snack_bar.dart';
import 'package:student_hub/common/ui/bottomNavigation/bottomAppbar_base.dart';
import 'package:student_hub/core/base_widget/base_widget.dart';
import 'package:student_hub/core/models/output/notification.dart';

@RoutePage()
class NotificationScreen
    extends BaseWidget<NotificationCubit, NotificationState> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return const NotificationWidget();
  }

  @override
  NotificationCubit? provideCubit(BuildContext context) {
    return NotificationCubit();
  }
}

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationWidget> with SnackBarDefault {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final notificationList = state.notifications;

        return Scaffold(
          appBar: AppBar(
            title: Text('Student Hub'),
            actions: [
              IconButton(
                onPressed: () {
                  context.router.replace(const SwitchAccountPageRoute());
                },
                icon: Icon(
                  Icons.account_circle,
                  size: 40.0,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildNotificationList(notificationList, context),
          ),
          bottomNavigationBar: const CustomBottomAppBar(),
        );
      },
    );
  }

  Widget _buildNotificationList(
      List<NotificationOutput> notifications, BuildContext context) {
    Map<String, List<NotificationOutput>> groupedNotifications = {};
    for (var notification in notifications) {
      // Group notifications by day
      DateTime createdAt = DateTime.parse(notification.createdAt!);
      final day = DateTime(createdAt.year, createdAt.month, createdAt.day);

      final formattedDay = _formatDay(day);
      groupedNotifications
          .putIfAbsent(formattedDay, () => [])
          .add(notification);
    }

    return ListView.builder(
      itemCount: groupedNotifications.length,
      itemBuilder: (context, index) {
        final day = groupedNotifications.keys.toList()[index];
        final notificationsForDay = groupedNotifications[day]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: <Widget>[
              Expanded(child: Divider()),
              Text(day),
              Expanded(child: Divider()),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notificationsForDay.length,
              itemBuilder: (context, index) {
                final notification = notificationsForDay[index];
                return _buildCurvedNotification(notification, context);
              },
            ),
          ],
        );
      },
    );
  }

Widget _buildCurvedNotification(
    NotificationOutput notification, BuildContext context) {
  IconData icon;
  String actionLabel;
  Function()? onPressedAction;

  switch (notification.typeNotifyFlag) {
    case '0': // Offer
      icon = Icons.link;
      actionLabel = 'View Offer';
      onPressedAction = () {
        // Add action for offer
        // Example: Navigator.pushNamed(context, '/offer', arguments: notification.offerId);
      };
      break;
    case '1': // Interview
    case '3': // Chat
      icon = Icons.chat;
      actionLabel = 'Open Chat';
      onPressedAction = () {
        // Add action for chat
        // Example: Navigator.pushNamed(context, '/chat', arguments: notification.chatId);
      };
      break;
    case '2': // Submitted
      icon = Icons.description;
      actionLabel = 'View Proposal';
      onPressedAction = () {
        // Add action for proposal
        // Example: Navigator.pushNamed(context, '/proposal', arguments: notification.proposalId);
      };
      break;
    case '4': // Hired
      icon = Icons.work;
      actionLabel = 'View Project';
      onPressedAction = () {
        // Add action for project
        // Example: Navigator.pushNamed(context, '/project', arguments: notification.projectId);
      };
      break;
    default:
      icon = Icons.notifications;
      actionLabel = 'View Notification';
      onPressedAction = () {
        // Add default action
      };
  }

  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 250, 169, 200),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(12.0),
      leading: Icon(icon),
      title: Text(notification.title ?? ''),
      subtitle: Text(notification.content ?? ''),
      trailing: IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: onPressedAction ,
      ),
    ),
  );
}

  String _formatDay(DateTime day) {
    final now = DateTime.now();
    if (now.year == day.year && now.month == day.month && now.day == day.day) {
      return 'Today';
    } else if (now.year == day.year &&
        now.month == day.month &&
        now.day - day.day == 1) {
      return 'Yesterday';
    } else {
      return '${day.day}/${day.month}/${day.year}';
    }
  }
}
