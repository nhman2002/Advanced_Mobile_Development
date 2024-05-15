import 'dart:convert';

import 'package:student_hub/UI/profileCreation/accountSwitchPage/cubit/accountSwitch_state.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/models/data_state.dart';
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
  final _authRepository = getIt.get<AuthRepository>();
  var userResult;
  @override
  Future<void> init() async {
    showLoading();
    userResult = await _authRepository.getUser();
    // if (_localStorage.getString(key: StorageKey.userName) == null ||
    //     _localStorage.getString(key: StorageKey.companyProfile) == null ||
    //     _localStorage.getString(key: StorageKey.studentProfile) == null) {
    await initProfile();
    // }
    await _handleInitial();
    hideLoading();
  }

  Future<void> initProfile() async {
    if (userResult is DataSuccess) {
      final companyProfile = userResult.data?.companyProfile;
      final studentProfile = userResult.data?.studentProfile;
      if (companyProfile != null) {
        String companyProfileString = jsonEncode(companyProfile);
        _localStorage.saveString(
            key: StorageKey.companyProfile, value: companyProfileString);
        _localStorage.saveString(
            key: StorageKey.companyID, value: companyProfile.id.toString());
      }
      if (studentProfile != null) {
        _localStorage.saveString(
            key: StorageKey.studentID, value: studentProfile.id.toString());
        _localStorage.saveString(
            key: StorageKey.studentProfile, value: 'studentProfileString');
      }
      final fullname = userResult.data?.fullname;
      // _localStorage.saveString(
      //     key: StorageKey.userID, value: userResult.data?.id.toString() ?? '');
      _localStorage.saveString(key: StorageKey.userName, value: fullname ?? '');
      final roles = userResult.data?.role as List?;
      if (roles != null && roles.length > 1) {
        final roleString = roles.join(",");
        _localStorage.saveString(key: StorageKey.userRoles, value: roleString);
        if (_localStorage.getString(key: StorageKey.currentRole) == 'null') {
          _localStorage.saveString(
              key: StorageKey.currentRole, value: roles.first.toString());
        }
      } else {
        // If there is no role or it's an empty list, handle it accordingly
        _localStorage.saveString(
            key: StorageKey.userRoles, value: roles.toString());

        _localStorage.saveString(
            key: StorageKey.currentRole, value: roles?.first.toString() ?? '');
      }
    }
  }

  Future<void> _handleInitial() async {
    // _localStorage.clear();
    String username = _localStorage.getString(key: StorageKey.userName)!;
    String userRoles = _localStorage.getString(key: StorageKey.userRoles)!;
    String currentRoleString =
        _localStorage.getString(key: StorageKey.currentRole)!;
    int currentRole = int.parse(currentRoleString);

    if (_localStorage.getString(key: StorageKey.companyProfile) != 'null') {
      emit(state.copyWith(hasCompanyProfile: true));
    } else {
      emit(state.copyWith(hasCompanyProfile: false));
    }

    if (_localStorage.getString(key: StorageKey.studentProfile) != 'null') {
      emit(state.copyWith(hasStudentProfile: true));
    } else {
      emit(state.copyWith(hasStudentProfile: false));
    }

    emit(state.copyWith(currentRole: currentRole));
    if (currentRole == 0) {
      emit(state.copyWith(userName: userResult.data.fullname));
    }

    if (_localStorage.getString(key: StorageKey.companyProfile) != 'null') {
      emit(state.copyWith(
          companyName: userResult.data.companyProfile.companyName));
    }

    // user roles look like [0] or [0,1]
    //transfrom into 0,1 or else

    userRoles = userRoles.replaceAll('[', '');
    userRoles = userRoles.replaceAll(']', '');
    List<int> userRolesList =
        userRoles.split(',').map((e) => int.parse(e)).toList();

    emit(state.copyWith(userRoles: userRolesList));
    if (userRoles.length > 1) {
      emit(state.copyWith(hasMultipleRoles: true));
    } else {
      emit(state.copyWith(hasMultipleRoles: false));
    }
  }

  Future<void> switchRole(int role) async {
    showLoading();
    _localStorage.saveString(
        key: StorageKey.currentRole, value: role.toString());
    emit(state.copyWith(currentRole: role));
    await init();
    hideLoading();
  }

  Future<void> logout() async {
    emit(state.copyWith(isLogin: false));
    await _localStorage.clear();
    await getIt.get<NotificationSocket>().updateToken();
    await getIt.get<NotificationSocket>().closeIsolate();
  }
}
