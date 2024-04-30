import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_state.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/message_model.dart';
import 'package:student_hub/core/models/output/message_output.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/message.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatCubit extends WidgetCubit<ChatState> {
  final int userId;
  final int receiverId;
  final int projectId;
  final String receiverName;

  late IO.Socket socket;
  final _accessToken =
      getIt<LocalStorage>().getString(key: StorageKey.accessToken);

  ChatCubit(
      {required this.userId,
      required this.receiverId,
      required this.projectId,
      required this.receiverName})
      : super(
            initialState: const ChatState(),
            parseJsonFunction: ChatState.fromJson);

  final _messages = getIt.get<MessageRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  bool socketInitialized = false;

  @override
  Future<void> init() async {
    showLoading();
    emit(state.copyWith(messageSent: false));
    final result =
        await _messages.getMessagesBetweenUser(receiverId, projectId);
    if (result is DataSuccess) {
      emit(state.copyWith(messages: result.data));
    } else {
      emit(state.copyWith(messages: null));
    }
    if (socketInitialized == false) {
      await connectSocket();
      socketInitialized = true;
    }

    hideLoading();
  }

  Future<void> connectSocket() async {
    // Initialize socket with server URL
    socket = IO.io(
        'http://192.168.1.18:4400',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

    print("Connecting to socket.io server");
    socket.io.options?['query'] = {'project_id': projectId};

    // Add authorization to header
    socket.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer $_accessToken',
    };
// Connect to the socket.io server
    await socket.connect();
    socket.on('RECEIVE_MESSAGE', (data) {
      print(data);
      // Update the state with the received message
    });
    // Listen to socket events
    socket.onAny((String event, data) {
      print([event, data]);
    });
  }

  void sendMessage(String message) {
    final form = MessageInput(
      senderId: userId,
      receiverId: receiverId,
      projectId: projectId,
      content: message,
      messageFlag: 0,
    );
    socket.emit('SEND_MESSAGE', form.toJson());
    emit(state.copyWith(messageSent: true));
  }
}
