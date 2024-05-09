import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/models/input/message_model.dart';

class NotificationSocket {
  IO.Socket socket = IO.io(
    'https://api.studenthub.dev',
    IO.OptionBuilder()
        .enableForceNew()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );


  final _notificationService = getIt.get<NotificationService>();
  final _localStorage = getIt.get<LocalStorage>();
  var _accessToken =
      getIt<LocalStorage>().getString(key: StorageKey.accessToken);
  var _userId = getIt<LocalStorage>().getString(key: StorageKey.userID);

  Future<void> _connectAndListen(SendPort sendPort) async {
    print("Connecting to notification socket server");

    socket.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer $_accessToken',
    };

    await socket.connect();

    socket.onConnect((data) {
      print('Connected to notification socket of user $_userId');
    });

    socket.onDisconnect((data) {
      socket.connect();
    });

    socket.on('NOTI_$_userId', (data) async {
      print('Received message: $data');
      final userid = data['notification']['receiverId'];
      final title = data['notification']['title'];
      final content = data['notification']['content'];
      final id = data['notification']['id'];
      //map it and send
      final message = (
        userid: userid,
        title: title,
        body: content,
        id: id,
      );
      sendPort.send(message);
    });

  }

  Future<void> updateToken() async {
    _accessToken = await _localStorage.getString(key: StorageKey.accessToken);
    _userId = await _localStorage.getString(key: StorageKey.userID);
    }

  Future<void> listenInBackground() async {

    //check if isolate already running
        final receivePort = ReceivePort();
    // final completer = Completer<OutputType>();
    final errorPort = ReceivePort()
      ..listen((message) {
        throw Exception(message);
      });
      //spawn named isolate

    IsolateNameServer.registerPortWithName(receivePort.sendPort, 'notificationIsolate');
    await Isolate.spawn(_connectAndListen, receivePort.sendPort, errorsAreFatal: true, onError: errorPort.sendPort);
    receivePort.listen((message) {
      if (_userId == message.userid.toString()) {
        _notificationService.showNotification(
            message.id, message.title, message.body, '');
      } else {
        print('message is null');
      }
    });
  }

  Future<void> closeIsolate() async{
    bool res = IsolateNameServer.removePortNameMapping('notificationIsolate');
    print('Isolate removed: $res');
  }

}
