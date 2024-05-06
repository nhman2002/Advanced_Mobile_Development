import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/socket/socket.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';


class AccountSwitchCubit extends WidgetCubit<AccountSwitchState> {
  AccountSwitchCubit()
      : super(
            initialState: const AccountSwitchState(),
            parseJsonFunction: AccountSwitchState.fromJson);


  final _localStorage = getIt.get<LocalStorage>();
  final _notificationService = getIt.get<NotificationService>();
  final _notiSocket = getIt.get<NotificationSocket>();

  @override
  Future<void> init() async {
    showLoading();
    await _handleInitial();
    hideLoading();
  }

  Future<void> _handleInitial() async {
    // _localStorage.clear();
    String username = _localStorage.getString(key: StorageKey.userName)!;
    String userRoles = _localStorage.getString(key: StorageKey.userRoles)!;
    String currentRole = _localStorage.getString(key: StorageKey.currentRole)!;


    if (_localStorage.getString(key: StorageKey.companyProfile) != null) {
      emit(state.copyWith(hasCompanyProfile: true));
    } else {
      emit(state.copyWith(hasCompanyProfile: false));
    }

    if (_localStorage.getString(key: StorageKey.studentProfile) != null) {
      emit(state.copyWith(hasStudentProfile: true));
    } else {
      emit(state.copyWith(hasStudentProfile: false));
    } 



    if (currentRole == "1") {
      emit(state.copyWith(isCompany: true));
      emit(state.copyWith(isStudent: false));
    } else {
      emit(state.copyWith(isStudent: true));
      emit(state.copyWith(isCompany: false));
    }

    if (userRoles.length > 1) {
      emit(state.copyWith(hasMultipleRoles: true));
    } else {
      emit(state.copyWith(hasMultipleRoles: false));
    }
    
  }
  


  Future<void> logout() async {
    emit(state.copyWith(isLogin: false));
    await _notiSocket.closeConnection();
    await _localStorage.clear();
  }

  Future<void> testNotification() async {
    await _notificationService.showNotification(0,
         "Test Notification",  "This is a test notification", "nothing to see here");
  }
}