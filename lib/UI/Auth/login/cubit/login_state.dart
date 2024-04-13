import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class LoginState extends WidgetState {
  final bool isLogin;
  final String? message;
  final User? user;

  const LoginState({
    this.isLogin = false,
    this.message,
    this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLogin,
        message,
        user,
      ];

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return {
      'isLogin': isLogin,
      'message': message,
      'user': user?.toJson(),
    };
  }

  factory LoginState.fromJson(Map<String, dynamic> json) {
    return LoginState(
      isLogin: json['isLogin'] as bool,
      message: json['message'] as String?,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  LoginState copyWith({
    bool? isLogin,
    String? message,
    User? user,
  }) {
    return LoginState(
      isLogin: isLogin ?? this.isLogin,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
