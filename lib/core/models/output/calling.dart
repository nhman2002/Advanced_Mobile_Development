class CallingModel {
  String? imageUrl;
  String? userName;
  String? icon;
  String? colorValue;
  String? subTitle;
  String? countNumber;
  String? arriveTime;
  bool? selectCarCategory;

  CallingModel({
    this.imageUrl,
    this.userName,
    this.icon,
    this.colorValue,
    this.subTitle,
    this.countNumber,
    this.arriveTime,
    this.selectCarCategory,
  });
}

class BHMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;
  MeetingModel? meetingInfo;

  BHMessageModel(
      {this.senderId, this.receiverId, this.msg, this.time, this.meetingInfo});
}

class MeetingModel {
  String? scheduleTitle;
  String? startTime;
  String? endTime;
  String? duration;
  bool? isCancel;

  MeetingModel(
      {this.scheduleTitle,
      this.startTime,
      this.endTime,
      this.duration,
      this.isCancel}) {
    duration = "60 minutes";
    isCancel = false;
  }
}