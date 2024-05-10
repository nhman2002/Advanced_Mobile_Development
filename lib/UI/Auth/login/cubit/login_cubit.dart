import 'dart:convert';

import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/output/company_model.dart';
import 'package:student_hub/core/models/input/login_model.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/socket/socket.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/auth/login/cubit/login_state.dart';

class LoginCubit extends WidgetCubit<LoginState> {
  LoginCubit()
      : super(
          initialState: const LoginState(),
          parseJsonFunction: LoginState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();
  final _userRepository = getIt.get<UserRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  final _notiSocket = getIt.get<NotificationSocket>();
  @override
  Future<void> init() async {

  }

  Future<void> login({String? email, String? password}) async {
    showLoading();
    final form = AuthForm().copyWith(email: email, password: password);
    final result = await _authRepository.login(form);
    if (result is DataSuccess) {
      final user = result.data?.user;
      final accessToken = result.data?.token?.toJson()['token'] as String?;
      await _localStorage.saveString(key: StorageKey.accessToken, value: accessToken ?? '');
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      //send a get to get user details
      final userResult = await _authRepository.getUser();
      if (userResult is DataSuccess) {
        final companyProfile = userResult.data?.companyProfile;
        final studentProfile = userResult.data?.studentProfile;
        if (companyProfile != null) {
          String companyProfileString = jsonEncode(companyProfile);
          _localStorage.saveString(key: StorageKey.companyProfile, value: companyProfileString);
          _localStorage.saveString(key: StorageKey.companyID, value: companyProfile.id.toString());
        }
        if (studentProfile != null) {
          String studentProfileString = jsonEncode(studentProfile);
          _localStorage.saveString(key: StorageKey.studentID, value: studentProfile.id.toString());
          _localStorage.saveString(key: StorageKey.studentProfile, value: studentProfileString);
        }

        final fullname = userResult.data?.fullname;
        _localStorage.saveString(key: StorageKey.userID, value: userResult.data?.id.toString() ?? '');
        _localStorage.saveString(key: StorageKey.userName, value: fullname ?? '');
        final roles = userResult.data?.role as List?;
        if (roles != null && roles.length > 1) {
          final roleString = roles.join(",");
          _localStorage.saveString(key: StorageKey.userRoles, value: roleString);
          _localStorage.saveString(key: StorageKey.currentRole, value: roles.first.toString());
        } else {
          // If there is no role or it's an empty list, handle it accordingly
          _localStorage.saveString(key: StorageKey.userRoles, value: roles.toString());
          _localStorage.saveString(key: StorageKey.currentRole, value: roles!.first.toString());
        }
        await getIt.get<NotificationSocket>().updateToken();
        emit(state.copyWith(user: user, isLogin: true));
        _notiSocket.listenInBackground();

      }
    } else {
      final errorDetails = result.error?.response?.data['errorDetails'];
      final errorMessage = errorDetails is List ? errorDetails.join(", ") : errorDetails as String?;
      emit(state.copyWith(isLogin: false, message: errorMessage ?? ''));
    }
    hideLoading();
  }
}