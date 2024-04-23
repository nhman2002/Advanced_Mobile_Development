import 'package:student_hub/core/models/output/user_model.dart';
import 'package:student_hub/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final bool? isLogin;
  final bool? isCompany;
  const SplashState({this.isLogin = null,this.isCompany = null});


  @override
  // TODO: implement props
  List<Object?> get props => [
    isLogin,
    isCompany
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SplashState.fromJson(Map<String, dynamic> json) {
    return SplashState(
      isLogin: json['isLogin'] as bool?,
      isCompany: json['isCompany'] as bool?
    );
  }

  SplashState copyWith({
    bool? isLogin,
    bool? isCompany
  }) {
    return SplashState(
      isLogin: isLogin ?? this.isLogin,
      isCompany: isCompany ?? this.isCompany
    );
  }
}