import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/local_notifications/notification_service.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/favoriteProject.dart';
import 'package:student_hub/core/repository/interview.dart';
import 'package:student_hub/core/repository/meetingRoom.dart';
import 'package:student_hub/core/repository/message.dart';
import 'package:student_hub/core/repository/notification.dart';
import 'package:student_hub/core/repository/profileStudent.dart';
import 'package:student_hub/core/repository/proposal.dart';
import 'package:student_hub/core/repository/skillSet.dart';
import 'package:student_hub/core/repository/techStack.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/repository/profileCompany.dart';
import 'package:student_hub/core/repository/project.dart';
import 'package:student_hub/core/socket/socket.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  getIt
    ..registerSingletonAsync<LocalStorage>(LocalStorage.init)
    ..registerSingleton<NetworkManager>(NetworkManager.initial())
    ..registerLazySingleton<AuthRepository>(AuthRepository.new)
    ..registerLazySingleton<UserRepository>(UserRepository.new)
    ..registerLazySingleton<CompanyProfileRepository>(CompanyProfileRepository.new)
    ..registerLazySingleton<ProjectRepository>(ProjectRepository.new)
    ..registerLazySingleton<FavoriteProjectRepository>(FavoriteProjectRepository.new)
    ..registerLazySingleton<TechStackRepository>(TechStackRepository.new)
    ..registerLazySingleton<SkillSetRepository>(SkillSetRepository.new)
    ..registerLazySingleton<StudentProfileRepository>(StudentProfileRepository.new)
    ..registerLazySingleton<ProposalRepository>(ProposalRepository.new)
    ..registerLazySingleton<MessageRepository>(MessageRepository.new)
    ..registerSingleton<NotificationService>(NotificationService.initial())
    ..registerLazySingleton<NotificationSocket>(NotificationSocket.new)
    ..registerLazySingleton<InterviewRepository>(InterviewRepository.new)
    ..registerLazySingleton<MeetingRoomRepository>(MeetingRoomRepository.new)
    ..registerLazySingleton<NotificationRepository>(NotificationRepository.new);
}