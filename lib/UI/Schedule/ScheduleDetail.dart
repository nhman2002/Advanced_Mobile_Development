import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Meetings'),
      ),
      body: ScheduleItem(
        isSender: false,
        name: 'Luis Pham',
        avatarUrl: 'assets/avatar.jpg',
        title: 'Interview with Candidate',
        duration: '60 minutes',
        day: 'Thursday',
        date: '13/03/2024',
        timeMeeting: '15:00 PM',
        endDay: 'Thursday',
        endDate: '13/03/2024',
        endTimeMeeting: '16:00 PM',
        time: DateTime.now(),
      ),
    ),
  ));
}

class ScheduleItem extends StatelessWidget {
  final bool isSender;
  final String name;
  final String avatarUrl;
  final String title;
  final String duration;
  final String day;
  final String date;
  final String timeMeeting;
  final String endDay;
  final String endDate;
  final String endTimeMeeting;
  final DateTime time;

  const ScheduleItem({
    Key? key,
    required this.isSender,
    required this.name,
    required this.avatarUrl,
    required this.title,
    required this.duration,
    required this.day,
    required this.date,
    required this.timeMeeting,
    required this.endDay,
    required this.endDate,
    required this.endTimeMeeting,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              backgroundImage: AssetImage(avatarUrl),
              radius: 20,
            ),
          if (!isSender) const SizedBox(width: 8),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSender ? Colors.white : Colors.grey[200],
                border: Border.all(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isSender)
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF008ABD),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Start time",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$day $date $timeMeeting',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "End time",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$endDay $endDate $endTimeMeeting',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF008ABD)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 36,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle Join Button Pressed
                        },
                        child: const Text(
                          "Join",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      OptionsButton(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(time),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSender) const SizedBox(width: 8),
          if (isSender)
            CircleAvatar(
              backgroundImage: AssetImage(avatarUrl),
              radius: 20,
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    // Implement your time formatting logic here
    return '';
  }
}

class OptionsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return OptionsDialog();
          },
        );
      },
      icon: const Icon(Icons.more_vert),
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF008ABD),
    );
  }
}

class OptionsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: const Text(
        'Options',
        style: TextStyle(
          color: Color(0xFF008ABD),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: const Text(
                'Re-schedule the meeting',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color.fromARGB(255, 210, 210, 210),
              height: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: const Text(
                'Cancel the meeting',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}
