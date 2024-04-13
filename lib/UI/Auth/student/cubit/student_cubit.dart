import 'package:student_hub/common/storage/local_storage.dart';
import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/network/network.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/user.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/Auth/student/cubit/student_state.dart';

class StudentRegisterCubit extends WidgetCubit<StudentRegisterState> {
  StudentRegisterCubit()
      : super(
          initialState: const StudentRegisterState(),
          parseJsonFunction: StudentRegisterState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();



  Future<void> register({String? email, String? password, String? name}) async {
    showLoading();
    final _form = RegisterForm().copyWith(email: email, password: password, fullname: name, role: 0);
    final result = await _authRepository.register(_form);
    if (result is DataSuccess) {
      emit(state.copyWith(isRegister: true, message: 'Register success! Please check your email to verify your account.'));
    } else {
      final errorDetails = result.error?.response?.data['errorDetails'];
      final errorMessage = errorDetails is List ? errorDetails.join(", ") : errorDetails as String?;
      emit(state.copyWith(isRegister: false, message: errorMessage ?? ''));    }
    hideLoading();
  }
  
  @override
  Future<void> init() async {

  }
}