import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:student_hub/common/config/navigation_event.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/message_model.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/interview.dart';
import 'package:student_hub/core/repository/meetingRoom.dart';

typedef ScheduleSuccessCallback = void Function();

class ScheduleDialog extends StatefulWidget {
  final int projectId;
  final int senderId;
  final int receiverId;
  final ScheduleSuccessCallback? onScheduleSuccess; 

  const ScheduleDialog({
    super.key,
    required this.projectId,
    required this.senderId,
    required this.receiverId,
    this.onScheduleSuccess, 
  });
  @override
  _ScheduleDialogState createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _meetingRoomCodeController;
  late DateTime _startTime;
  late DateTime _endTime;
  late TextEditingController _meetingRoomController;
  final _interview = getIt.get<InterviewRepository>();
  final _meetingRoom = getIt.get<MeetingRoomRepository>();
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _meetingRoomCodeController = TextEditingController();
    _startTime = DateTime.now();
    _endTime = DateTime.now().add(Duration(hours: 1));
    _meetingRoomController = TextEditingController();

  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _meetingRoomController.dispose();
    _meetingRoomCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("schedulemeeting1".tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: "schedulemeeting2".tr()),
          ),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(labelText: "schedulemeeting3".tr()),
          ),
          Row(
            children: [
              Text("schedulemeeting4".tr()),
              TextButton(
                onPressed: () => _selectStartTime(context),
                child: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(_startTime),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("schedulemeeting5".tr()),
              TextButton(
                onPressed: () => _selectEndTime(context),
                child: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(_endTime),
                ),
              ),
            ],
          ),
          TextField(
            controller: _meetingRoomController,
            decoration: InputDecoration(labelText: "schedulemeeting6".tr()),
          ),
          TextField(
            controller: _meetingRoomCodeController,
            decoration: InputDecoration(labelText: "schedulemeeting7".tr()),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("schedulemeeting8".tr()),
        ),
        TextButton(
          onPressed: () {
            handleScheldule(context);
            Navigator.of(context).pop();
          },
          child: Text("schedulemeeting9".tr()),
        ),
      ],
    );
  }
    Future<void> _selectStartTime(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _startTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_startTime),
      );
      if (pickedTime != null) {
        setState(() {
          _startTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _endTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_endTime),
      );
      if (pickedTime != null) {
        setState(() {
          _endTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  Future<void> handleScheldule(BuildContext context) async {
    //check if every param isnt null
    if (_titleController.text.isEmpty ||
        _contentController.text.isEmpty ||
        _meetingRoomController.text.isEmpty) {
      ShowSnackBarWarningEvent("forgotpassword_auth6".tr());
      return;
    }
    String startTime = _startTime.toIso8601String();
    String endTime = _endTime.toIso8601String();
    final InterviewInput form = InterviewInput(
      title: _titleController.text,
      content: _contentController.text,
      startTime: startTime,
      endTime: endTime,
      meetingRoomCode: _meetingRoomCodeController.text,
      meetingRoomId: _meetingRoomController.text,
      projectId: widget.projectId,
      senderId: widget.senderId,
      receiverId: widget.receiverId,
    );
    //check if the meeting room is available, if not create
    final result = await _meetingRoom.checkAvailability(_meetingRoomController.text, _meetingRoomController.text);
    if (result is DataSuccess) {
      print('meeting room ready');
    }
    // else
    // {
    //   MeetingRoomInput meetingRoom = MeetingRoomInput(
    //     meetingRoomCode: _meetingRoomController.text,
    //     meetingRoomId: _meetingRoomController.text,
    //     expiredAt: endTime,
    //   );
    //   await _meetingRoom.postMeetingRoom(meetingRoom);
    // }
    final result1 = await _interview.postInterview(form);
    if (result1 is DataError) {
      ShowSnackBarWarningEvent("schedulemeeting10".tr());
    } else if (result1 is DataSuccess) {
      ShowSnackBarSuccessEvent("schedulemeeting11".tr());
      widget.onScheduleSuccess?.call(); // Call the callback function
    }   //call api to create meeting

  }
}