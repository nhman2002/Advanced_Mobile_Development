import 'package:student_hub/UI/notification/cubit/notification_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/repository/notification.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';


class NotificationCubit extends WidgetCubit<NotificationState> {
  NotificationCubit()
      : super(
            initialState: const NotificationState(),
            parseJsonFunction: NotificationState.fromJson);


  final _localStorage = getIt.get<LocalStorage>();
  final _notification = getIt.get<NotificationRepository>();

  @override
  Future<void> init() async {
    showLoading();
    final userIdString = _localStorage.getString(key: StorageKey.userID);
    var userId = int.parse(userIdString!);

    final result = await _notification.getNotifications(userId);
    if (result is DataSuccess) {
      emit(state.copyWith(notifications: result.data));
    } else {
      emit(state.copyWith(notifications: null));
    }
    hideLoading();
  }

}

