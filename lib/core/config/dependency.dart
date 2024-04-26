import 'package:get_it/get_it.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/favoriteProject.dart';
import 'package:student_hub/core/repository/profileStudent.dart';
import 'package:student_hub/core/repository/proposal.dart';
import 'package:student_hub/core/repository/skillSet.dart';
import 'package:student_hub/core/repository/techStack.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/repository/profileCompany.dart';
import 'package:student_hub/core/repository/project.dart';

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
    ..registerLazySingleton<ProposalRepository>(ProposalRepository.new);
}