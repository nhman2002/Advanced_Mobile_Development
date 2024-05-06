import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/models/input/message_model.dart';

class NotificationSocket {
  IO.Socket socket = IO.io(
    'http://192.168.1.10:4400',
    IO.OptionBuilder()
        .enableForceNew()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .build(),
  );
  final _notificationService = getIt.get<NotificationService>();
  final _localStorage = getIt.get<LocalStorage>();
  final _accessToken = 
      getIt<LocalStorage>().getString(key: StorageKey.accessToken);
  final _userId = getIt<LocalStorage>().getString(key: StorageKey.userID);
    
    
  Future<void> _connectAndListen(SendPort sendport) async {

    print("Connecting to notification socket server");

    socket.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer $_accessToken',
    };

    await socket.connect();

    socket.onConnect((data) {
      print('Connected to notification socket');
    });

    socket.onDisconnect((data) {
      print('Disconnected from notification socket');
    });

    socket.on('NOTI_$_userId', (data) async {
      print('Received message: $data');
      final title = data['notification']['title'];
      final content = data['notification']['content'];
      final id = data['notification']['id'];
      //map it and send
      final message = (
        title: title,
        body: content,
        id: id,
      );
      sendport.send(message);

     });
  }

  Future<void> listenInBackground() async {
    // final completer = Completer<OutputType>();
    final receivePort = ReceivePort();
    final errorPort = ReceivePort()
      ..listen((message) {
        throw Exception(message);
      });
    await Isolate.spawn(_connectAndListen, receivePort.sendPort
        );
    receivePort.listen((message) { 
      _notificationService.showNotification(message.id, message.title, message.body, '');
      });

  }

  Future<void> closeConnection() async {
    socket.close();
    Isolate.current.kill();
  }

}
