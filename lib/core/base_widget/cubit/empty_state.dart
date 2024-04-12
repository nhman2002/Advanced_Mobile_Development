import 'package:student_hub/core/widget_cubit/widget_state.dart';

class EmptyState extends WidgetState {
  const EmptyState();

  factory EmptyState.fromJson(Map<String, dynamic> json) {
    return const EmptyState();
  }

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
