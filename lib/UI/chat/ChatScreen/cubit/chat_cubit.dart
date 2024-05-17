
import 'package:flutter/foundation.dart';
import 'package:student_hub/UI/chat/ChatScreen/cubit/chat_state.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/message_model.dart';
import 'package:student_hub/core/models/input/proposal_model.dart';
import 'package:student_hub/core/repository/message.dart';
import 'package:student_hub/core/repository/proposal.dart';
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
  final _proposal = getIt.get<ProposalRepository>();
  bool socketInitialized = false;


  @override
  Future<void> init() async {
    showLoading();
    // emit(state.copyWith(messageSent: false));
    emit(state.copyWith(messageReceived: false));
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
        'https://api.studenthub.dev',
        IO.OptionBuilder()
            .enableForceNew()
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

    socket.connect();
    socket.onConnect((data) => {
          print('Connected to chat'),
        });
    socket.on('RECEIVE_MESSAGE', (data) {
  
  // Extract senderId and receiverId from the received message
  int senderId = data['notification']['sender']['id'];
  int reiId = data['notification']['receiver']['id'];
  List<int> check = <int>[senderId, reiId];
  List<int> local = <int>[userId, receiverId];
  // Check ifcheck and local has the same elenments
  if (check.toSet().difference(local.toSet()).isEmpty) {

    emit(state.copyWith(messageReceived: true));
  }
    });
    // Listen to socket events
    socket.onAny((String event, data) {
      print([event, data]);
    });
  }

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) {
      return;
    }
    //check if the there is any message in state (check length)


    final form = MessageInput(
      content: message,
      projectId: projectId,
      senderId: userId,
      receiverId: receiverId,
      messageFlag: 0,
    );
    final result = await _messages.sendMessage(form);
    if (result is DataSuccess) {
      if (state.messages.isEmpty) {
        activeProposal(projectId);
      }

      emit(state.copyWith(messageSent: true));
    } else {
      emit(state.copyWith(messageSent: false));
    }
  }

  Future<void> receiveMessageUpdate() async {
    emit(state.copyWith(messageReceived: true));
  }

  @override
  Future<void> close() async {
    if (kDebugMode) {
      print("Closing socket on $projectId");
    }
    socket.close();
    super.close();
  }

    Future<void> activeProposal(int proposalId) async {
    final form = ProposalPatchForm().copyWith(
      statusFlag: 1
    );

    final result = await _proposal.updateProposal(proposalId, form);
    if (result is DataSuccess) {
      emit(state.copyWith(message: 'Proposal activated successfully'));
    }
    else {
      emit(state.copyWith(message: 'Error'));
    }
  }
} 
