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
    // _localStorage.clear();
    final accessToken = _localStorage.getString(
      key: StorageKey.accessToken,
    );

    final currentRole = _localStorage.getString(key: StorageKey.currentRole);
    final hasStudentProfile = _localStorage.getString(
      key: StorageKey.studentProfile,
    );
    final hasCompanyProfile = _localStorage.getString(
      key: StorageKey.companyProfile,
    );
    if (accessToken == null) {
      emit(state.copyWith(isLogin: false));
    } else {
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      if (currentRole == "0"){
        emit(state.copyWith(isCompany: false));
        if (hasStudentProfile != null) 
          emit(state.copyWith(hasProfile: true));
        else
          emit(state.copyWith(hasProfile: false));
      }
      else if (currentRole == "1"){
        emit(state.copyWith(isCompany: true));
        if (hasCompanyProfile != null)
          emit(state.copyWith(hasProfile: true));
        else
          emit(state.copyWith(hasProfile: false));
      }
      emit(state.copyWith(isLogin: true));
    }
  }
  


  Future<void> logout() async {
    await _localStorage.clear();
    emit(state.copyWith(isLogin: false));
  }
}