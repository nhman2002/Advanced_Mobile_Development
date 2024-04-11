import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:student_hub/core/network/network.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // if (!getIt.isRegistered<LocalStorage>()) {
  //   getIt.registerSingleton<LocalStorage>(LocalStorage());
  // }

  getIt.registerSingletonAsync<Dio>(NetworkManager().initDio);
}