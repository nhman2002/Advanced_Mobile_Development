import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/base.dart';
import 'package:student_hub/core/repository/user.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  getIt
    ..registerSingletonAsync<LocalStorage>(LocalStorage.init)
    ..registerSingletonAsync<Dio>(NetworkManager().initDio)
    ..registerLazySingleton<AuthRepository>(AuthRepository.new);
}