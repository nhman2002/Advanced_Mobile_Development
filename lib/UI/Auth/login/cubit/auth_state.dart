import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class AuthState extends WidgetState {
  final bool isRegister;
  final bool isLogin;
  final String? message;
  final User? user;

  const AuthState({
    this.isRegister = false,
    this.isLogin = false,
    this.message,
    this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        isRegister,
        isLogin,
        message,
        user,
      ];

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return {
      'isRegister': isRegister,
      'isLogin': isLogin,
      'message': message,
      'user': user?.toJson(),
    };
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      isRegister: json['isRegister'] as bool,
      isLogin: json['isLogin'] as bool,
      message: json['message'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  AuthState copyWith({
    bool? isRegister,
    bool? isLogin,
    String? message,
    User? user,
  }) {
    return AuthState(
      isRegister: isRegister ?? this.isRegister,
      isLogin: isLogin ?? this.isLogin,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
