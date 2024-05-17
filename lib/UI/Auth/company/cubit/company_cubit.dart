import 'package:student_hub/core/config/dependency.dart';
import 'package:student_hub/core/models/data_state.dart';
import 'package:student_hub/core/models/input/register_model.dart';
import 'package:student_hub/core/repository/auth.dart';
import 'package:student_hub/core/repository/general.dart';
import 'package:student_hub/core/widget_cubit/widget_cubit.dart';
import 'package:student_hub/UI/auth/company/cubit/company_state.dart';

class CompanyRegisterCubit extends WidgetCubit<CompanyRegisterState> {
  CompanyRegisterCubit()
      : super(
          initialState: const CompanyRegisterState(),
          parseJsonFunction: CompanyRegisterState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();
  final _general = getIt.get<GeneralRepository>();



  Future<void> register({String? email, String? password, String? name}) async {
    showLoading();
    final form = RegisterForm().copyWith(email: email, password: password, fullname: name, role: 1);
    final result = await _authRepository.register(form);
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