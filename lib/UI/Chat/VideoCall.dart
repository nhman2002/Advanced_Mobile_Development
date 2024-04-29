import 'package:flutter/material.dart';

void main() {
  runApp(VideoCallScreen());
}

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: Text(
            "Video call",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF008ABD),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                // Video player widget
                Expanded(
                  flex: 5, // Divide the ratio 4:6 for top and bottom parts
                  child: Container(
                    color: Colors.green, // Background color for video
                    // Increased the height of the container
                    child: Center(
                      child: Text(
                        'Video will be displayed here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Bottom part: Video player widget
                Expanded(
                  flex: 5,
                  child: Container(
                    color: const Color(0xFF008ABD), // Background color for video
                    // Increased the height of the container
                    child: Center(
                      child: Text(
                        'Video will be displayed here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
            
            // Positioned widget inside the stack
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mute button
                  IconButton(
                    icon: Icon(Icons.mic_off),
                    onPressed: () {
                      // Handle mute action
                    },
                  ),
                  SizedBox(width: 20),
                  // End call button
                  FloatingActionButton(
                    onPressed: () {
                      // Handle end call action
                    },
                    backgroundColor: const Color(0xFF008ABD),
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  // Camera switch button
                  IconButton(
                    icon: Icon(
                      Icons.switch_camera,
                    ),
                    onPressed: () {
                      // Handle camera switch action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}