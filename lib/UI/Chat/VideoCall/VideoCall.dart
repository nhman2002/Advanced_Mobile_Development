import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class VideoCallScreen extends StatefulWidget {
  final String channelName;

  const VideoCallScreen({Key? key, required this.channelName})
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
    // Initialize the Agora client
    final agoraClient = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "0d51072268ce4de290abe457321b0ac5",
          channelName: widget.channelName,
          tempToken:
              "007eJxTYJjIvPecVe2ME07auS2nxXu9r/AeW2Jm8Jfv3Y0Ugw/vLW8rMBikmBoamBsZmVkkp5qkpBpZGiQmpZqYmhsbGSYZJCabcsbZpTUEMjIsjX7FwsgAgSA+G0NuSUFmah4DAwCXEyBI"),
    );

    await agoraClient.initialize();
    setState(() {
      client = agoraClient; // Assign the initialized client
    });
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
    return PopScope(
        onPopInvoked: (bool didPop) {
          if (didPop) {
            
            
            }
          return;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Video Call'),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                AgoraVideoViewer(client: client!,
                    layoutType: Layout.floating,
                    showNumberOfUsers: true,
                ),
                AgoraVideoButtons(client: client!),
              ],
            ),
          ),
        ));
  }
}
