import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Shub.dart';
import 'package:student_hub/UI/splash_screen/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends WidgetCubit<SplashState> {
  SplashCubit()
      : super(
            initialState: const SplashState(),
            parseJsonFunction: SplashState.fromJson);


  final _localStorage = getIt.get<LocalStorage>();
  final _authRepository = getIt.get<AuthRepository>();

  @override
  Future<void> init() async {
    await _handleInitial();
  }

  Future<void> _handleInitial() async {
    final accessToken = _localStorage.getString(
      key: StorageKey.accessToken,
    );

    if (accessToken == null) {
      emit(state.copyWith(isLogin: false));
    } else {
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      emit(state.copyWith(isLogin: true));
    }
  }



  // Future<void> logout() async {
  //   await _localStorage.clear();
  //   emit(state.copyWith(isLogin: false));
  // }
}