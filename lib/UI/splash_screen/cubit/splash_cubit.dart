import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:student_hub/common/config/navigation_event.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends WidgetCubit<SplashState> {
  SplashCubit()
      : super(
            initialState: const SplashState(),
            parseJsonFunction: SplashState.fromJson);


  final _localStorage = getIt.get<LocalStorage>();
  final _authRepository = getIt.get<AuthRepository>();

  @override
  Future<void> init() async {
    await _handleInitial();
  }


  Future<void> _handleInitial() async {
    // _localStorage.clear();
    final accessToken = _localStorage.getString(
      key: StorageKey.accessToken,
    );

    final currentRole = _localStorage.getString(key: StorageKey.currentRole);
    final hasStudentProfile = _localStorage.getString(
      key: StorageKey.studentProfile,
    );
    final hasCompanyProfile = _localStorage.getString(
      key: StorageKey.companyProfile,
    );
    if (accessToken == null) {
      emit(state.copyWith(isLogin: false));
    } else {
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      if (currentRole == "0"){
        emit(state.copyWith(isCompany: false));
        if (hasStudentProfile != null) 
          emit(state.copyWith(hasProfile: true));
        else
          emit(state.copyWith(hasProfile: false));
      }
      else if (currentRole == "1"){
        emit(state.copyWith(isCompany: true));
        if (hasCompanyProfile != null)
          emit(state.copyWith(hasProfile: true));
        else
          emit(state.copyWith(hasProfile: false));
      }
      emit(state.copyWith(isLogin: true));
    }
  }
  


  Future<void> logout() async {
    await _localStorage.clear();
    emit(state.copyWith(isLogin: false));
  }

  late IO.Socket notiSocket;


  Future<void> connectSocket(int id) async {

    final accessToken = _localStorage.getString(key: StorageKey.accessToken);
    // Initialize socket with server URL
    notiSocket = IO.io(
      'https://api.studenthub.dev/api',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    // notiSocket.io.options?['query'] = {
          
    //     };

    print("Opening noti socket connection");

    // Add authorization to header
    notiSocket.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer $accessToken',
    };
// Connect to the socket.io server
    notiSocket.connect();

    // Listen to socket events
    notiSocket.onAny((String event, data) {
      print('got sth on noti socket ' + event + ' ' + data.toString());
    });

    // Listen to channel to receive messages
    notiSocket.on('NOTI_$id', (data) {
      // ShowSnackBarEvent(data);
    });

    // Listen for error from socket
    notiSocket.on('ERROR', (data) => print('Socket Error: $data'));
  }

  Future<void> closeSocket() async {
    notiSocket.close();
  }

}