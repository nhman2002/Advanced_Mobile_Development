import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
          bottomNavigationBar: const CustomBottomAppBar(selectedTab: 'Notifications'),
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
    List<Widget> actions = [];

    switch (notification.typeNotifyFlag) {
      case '0': // Offer
        icon = Icons.link;
        actionLabel = "notificationscreen1".tr();
        onPressedAction = () {
          context.router.push(const StudentDashBoardWrapperRoute());
        };
        
        break;
      case '1': // Interview
        icon = Icons.calendar_today;
        actionLabel = 'View Interview';
        onPressedAction = () {
          context.router.push(const MessageListScreenRoute());
        };
        break;
      case '3': // Chat
        icon = Icons.chat;
        actionLabel = "notificationscreen4".tr();
        onPressedAction = () {
          // Add action for chat
          context.router.push(const MessageListScreenRoute());
  
        };
        break;
      case '2': // Submitted
        icon = Icons.description;
        actionLabel = "notificationscreen5".tr();
        onPressedAction = () {
          context.router.push(const CompanyDashboardWrapperRoute());
          // Add action for proposal
          // Example: Navigator.pushNamed(context, '/proposal', arguments: notification.proposalId);
        };
        break;
      case '4': // Hired
        icon = Icons.work;
        actionLabel =  "notificationscreen6".tr();
        onPressedAction = () {
          context.router.push(const StudentDashBoardWrapperRoute());
        };
        break;
      default:
        icon = Icons.notifications;
        actionLabel = "notificationscreen7".tr();
        onPressedAction = () {
          // Add default action
        };
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(12.0),
        leading: Icon(icon,
            color: Theme.of(context).colorScheme.onTertiaryContainer),
        title: Text(notification.title ?? '',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.content ?? '',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer)),
            if (notification.typeNotifyFlag == '0')
              ...actions, // Show actions if it's an offer
          ],
        ),
        trailing: notification.typeNotifyFlag == '0'
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_forward,
                    color: Theme.of(context).colorScheme.onTertiaryContainer),
                onPressed: onPressedAction,
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
      return "messagedetail5".tr();
    } else {
      return '${day.day}/${day.month}/${day.year}';
    }
  }
}
