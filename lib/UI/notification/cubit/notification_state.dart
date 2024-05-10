import 'package:student_hub/core/models/output/notification.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class NotificationState extends WidgetState {
  final List<NotificationOutput> notifications;

  const NotificationState({
    this.notifications = const [],
  });

  factory NotificationState.fromJson(Map<String, dynamic> json) {
    return NotificationState(
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  

  @override
  // TODO: implement props
  List<Object?> get props => [
    notifications,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }



  NotificationState copyWith({
    List<NotificationOutput>? notifications,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }
}