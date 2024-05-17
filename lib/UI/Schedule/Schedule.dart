import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';



class ScheduleDialog extends StatefulWidget {
  final int projectId;
  final int senderId;
  final int receiverId;

  const ScheduleDialog({
    super.key,
    required this.projectId,
    required this.senderId,
    required this.receiverId,
  });

  @override
  State<ScheduleDialog> createState() => _MyScheduleState();
}

class _MyScheduleState extends State<ScheduleDialog> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController jobTitleController = TextEditingController();
  bool isJobTitleEmpty = false;
  bool isDateCheck = false;
  bool isTimeCheck = false;
  @override
  void dispose() {
    jobTitleController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (picked != null) {
      setState(() {
        selectedEndTime = picked;
      });
    }
  }

  String get durationTime {
    final startDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    final endDateTime = DateTime(
      selectedEndDate.year,
      selectedEndDate.month,
      selectedEndDate.day,
      selectedEndTime.hour,
      selectedEndTime.minute,
    );

    final duration = endDateTime.difference(startDateTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours == 0) {
      return minutes > 0 ? '$minutes minutes' : '';
    } else {
      return '$hours hours ${minutes > 0 ? '$minutes minutes' : ''}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("schedule_schedule1".tr()),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "schedule_schedule2".tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: jobTitleController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "schedule_schedule3".tr(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "schedule_schedule4".tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.calendar_today),
                    label: Text("schedule_schedule5".tr()),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () => _selectTime(context),
                    icon: const Icon(Icons.access_time),
                    label: Text("schedule_schedule6".tr()),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "schedule_schedule7".tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _selectEndDate(context),
                    icon: const Icon(Icons.calendar_today),
                    label: Text("schedule_schedule8".tr()),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () => _selectEndTime(context),
                    icon: const Icon(Icons.access_time),
                    label: Text("schedule_schedule9".tr()),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                '${"schedule_schedule10".tr()}$durationTime',
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("schedule_schedule11".tr()),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Send Invite action
                      print('${"schedule_schedule12".tr()}${jobTitleController.text}');
                      print('${"schedule_schedule13".tr()}$selectedDate ${selectedTime.format(context)}');
                      print('${"schedule_schedule14".tr()}$selectedEndDate ${selectedEndTime.format(context)}');
                      print('${"schedule_schedule15".tr()}$durationTime');
                    },
                    child: Text("schedule_schedule16".tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}