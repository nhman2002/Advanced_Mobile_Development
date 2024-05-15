import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class VideoCallScreen extends StatefulWidget {
  final String channelName;
  final String? tempToken;

  const VideoCallScreen({Key? key, required this.channelName, this.tempToken})
      : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? client; // Make client nullable


  @override
  void initState() {
    super.initState();
    initializeAgora();
  }

  void initializeAgora() async {
    try {
      // Initialize the Agora client
      final agoraClient = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "0d51072268ce4de290abe457321b0ac5",
          channelName: widget.channelName,
          tempToken:
              widget.tempToken, // Pass the temp token to the Agora client
        ),
      );

      await agoraClient.initialize();
      setState(() {
        client = agoraClient; // Assign the initialized client
      });
    } catch (e) {
      // Handle AgoraRtmChannelException here
      print('AgoraRtmChannelException occurred: $e');
      // You can choose to ignore the exception or handle it gracefully
    }
  }

  @override
  void dispose() {
    super.dispose();
    client?.release();
  }

  @override
  Widget build(BuildContext context) {
    if (client == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Video Call'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Video Call'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client!,
              layoutType: Layout.floating,
              showNumberOfUsers: true,
            ),
            AgoraVideoButtons(client: client!),
          ],
        ),
      ),
    );
  }
}
