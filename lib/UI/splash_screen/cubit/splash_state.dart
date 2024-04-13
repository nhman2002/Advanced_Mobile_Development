import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final bool? isLogin;
  const SplashState({this.isLogin = null});

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLogin,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SplashState.fromJson(Map<String, dynamic> json) {
    return SplashState(
      isLogin: json['isLogin'] as bool?,
    );
  }

  SplashState copyWith({
    bool? isLogin,
  }) {
    return SplashState(
      isLogin: isLogin ?? this.isLogin,
    );
  }
}