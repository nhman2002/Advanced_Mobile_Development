import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class VideoCallScreen extends StatefulWidget {
  final String channelName;

  const VideoCallScreen({Key? key, required this.channelName}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}


class _VideoCallScreenState extends State<VideoCallScreen> {
  AgoraClient? client; // Make client nullable

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    var micStatus = await Permission.microphone.request();

    if (cameraStatus.isGranted && micStatus.isGranted) {
      initializeAgora();
    } else {
      // Handle permissions not granted
    }
  }

  void initializeAgora() async {
    // Initialize the Agora client
    final agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "0d51072268ce4de290abe457321b0ac5",
        channelName: widget.channelName,
      ),
    );

    await agoraClient.initialize();

    setState(() {
      client = agoraClient; // Assign the initialized client
    });
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
        title: Text('Video Call'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client!), 
            AgoraVideoButtons(client: client!),
          ],
        ),
      ),
    );
  }
}