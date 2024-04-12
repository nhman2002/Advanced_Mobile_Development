import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/auth_model.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Auth/login/cubit/auth_state.dart';

class AuthCubit extends WidgetCubit<AuthState> {
  AuthCubit()
      : super(
          initialState: const AuthState(),
          parseJsonFunction: AuthState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();
  final _userRepository = getIt.get<UserRepository>();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Future<void> init() async {

  }

  Future<void> login({String? email, String? password}) async {
    final form = AuthForm().copyWith(email: email, password: password);
    final result = await _authRepository.login(form);
    if (result is DataSuccess) {
      final user = result.data?.user;
      final accessToken = result.data?.token?.toJson()['token'] as String?;
      _localStorage.saveString(key: StorageKey.accessToken, value: accessToken ?? '');
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      emit(state.copyWith(user: user, isLogin: true));
    } else {
      final errorDetails = result.error?.response?.data['errorDetails'];
      final errorMessage = errorDetails is List ? errorDetails.join(", ") : errorDetails as String?;
      emit(state.copyWith(isLogin: false, message: errorMessage ?? ''));
    }
  }
}