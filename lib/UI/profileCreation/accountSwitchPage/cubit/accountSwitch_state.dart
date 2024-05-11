import 'package:student_hub/core/widget_cubit/widget_state.dart';

class AccountSwitchState extends WidgetState {
  final bool? isLogin;
  final bool? isStudent;
  final bool? isCompany;
  final bool? hasMultipleRoles; 
  final bool? hasStudentProfile;
  final bool? hasCompanyProfile;
  const AccountSwitchState({
    this.isLogin = null,
    this.isStudent = null,
    this.isCompany = null,
    this.hasMultipleRoles = null,
    this.hasStudentProfile = null,
    this.hasCompanyProfile = null

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLogin,
    isStudent,
    isCompany,
    hasMultipleRoles,
    hasCompanyProfile,
    hasStudentProfile
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory AccountSwitchState.fromJson(Map<String, dynamic> json) {
    return AccountSwitchState(
      isLogin: json['isLogin'] as bool?,
      isStudent: json['isStudent'] as bool?,
      isCompany: json['isCompany'] as bool?,
      hasMultipleRoles: json['hasMultipleRoles'] as bool?,
      hasCompanyProfile: json['hasCompanyProfile'] as bool?,
      hasStudentProfile: json['hasStudentProfiles'] as bool?

    );
  }

  AccountSwitchState copyWith({
    bool? isLogin,
    bool? isStudent,
    bool? isCompany,
    bool? hasMultipleRoles,
    bool? hasCompanyProfile,
    bool? hasStudentProfile
  }) {
    return AccountSwitchState(
      isLogin: isLogin ?? this.isLogin,
      isStudent: isStudent ?? this.isStudent,
      isCompany: isCompany ?? this.isCompany,
      hasMultipleRoles: hasMultipleRoles ?? this.hasMultipleRoles,
      hasCompanyProfile: hasCompanyProfile ?? this.hasCompanyProfile,
      hasStudentProfile: hasStudentProfile ?? this.hasStudentProfile
    );
  }
}