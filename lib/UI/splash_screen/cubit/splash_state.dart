import 'package:student_hub/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final bool? isLogin;
  final bool? isCompany;
  final bool? hasProfile;

  const SplashState({this.isLogin,this.isCompany,this.hasProfile});

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLogin,
    isCompany,
    hasProfile
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SplashState.fromJson(Map<String, dynamic> json) {
    return SplashState(
      isLogin: json['isLogin'] as bool?,
      isCompany: json['isCompany'] as bool?,
      hasProfile: json['hasProfile'] as bool?
    );
  }

  SplashState copyWith({
    bool? isLogin,
    bool? isCompany,
    bool? hasProfile

  }) {
    return SplashState(
      isLogin: isLogin ?? this.isLogin,
      isCompany: isCompany ?? this.isCompany,
      hasProfile: hasProfile ?? this.hasProfile
    );
  }
}